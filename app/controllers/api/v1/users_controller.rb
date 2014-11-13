class Api::V1::UsersController < Api::V1::BaseController

    skip_before_filter :authenticate, only: [:register, :login, :strong_login]

    def register
        if params[:email].present? && params[:password].present?
            @user = User.new(email: params[:email].downcase, password: params[:password])

            if @user.save
                render json: { status: 'ok', token: @user.token }, status: 201
            else
                error = @user.errors.messages
                render json: { status: 'error', error: error }, status: 400
            end
        else
            render_missing_parameters
        end
    end

    def login
        if params[:email].present? && params[:password].present?
            @user = User.find_by(email: params[:email])

            if @user && @user.valid_password?(params[:password])
                render json: { status: 'ok', token: @user.token }
            else
                render_wrong_login
            end
        else
            render_missing_parameters
        end
    end

    def strong_login
        if params[:email].present? && params[:password].present? && params[:pin_code].present?
            @user = User.find_by(email: params[:email])

            if @user && @user.valid_password?(params[:password]) && @user.pin_code_is?(params[:pin_code].to_i)
                render json: { status: 'ok', token: @user.token }
            else
                render_wrong_login
            end
        else
            render_missing_parameters
        end
    end

    def update
        if params[:id].to_i == current_user.id
            current_user.update_attributes(user_params)
            render nothing: true, status: 204
        else
            render_not_allowed
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :firstname,
            :lastname,
            :gender,
            :birthdate,
            :phone,
            :pincode
        )
    end
end
