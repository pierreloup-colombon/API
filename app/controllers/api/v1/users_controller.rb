class Api::V1::UsersController < Api::V1::BaseController
    def register
        if params[:email].present? && params[:password].present?
            @user = User.new(email: params[:email].downcase, password: params[:password])

            if @user.save
                render json: { status: 'ok', token: @user.token }, status: 201
            else
                error = @user.errors
                render json: { status: 'error', error: error }, status: 400
            end
        else
            render_missing_parameters
        end
    end

    def login
        if params[:email].present? && params[:password].present?
            @user = User.find_by(email: params[:email])

            if @user && @user.password == params[:password]
                render json: { status: 'ok', token: @user.token }
            else
                render_wrong_login
            end
        else
            render_missing_parameters
        end
    end
end
