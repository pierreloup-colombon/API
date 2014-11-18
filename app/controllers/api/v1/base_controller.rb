class Api::V1::BaseController < ActionController::Base
    protect_from_forgery with: :null_session

    rescue_from ArgumentError do |e|
        render json: { status: 'error', message: e.message}, code: :bad_request
    end

    before_action :authenticate

    def authenticate
        authenticate_token || render_unauthorized
    end

    def authenticate_token
        authenticate_with_http_token do |token, options|
            @current_user = User.find_by(token: token)
        end
    end

    def current_user
        @current_user
    end

    def render_bad_parameters
        render json: { status: 'error', msg: 'bad parameters' }
    end

    def render_unauthorized
        render json: { status: 'error', msg: 'bad credentials' }, status: 400
    end

    def render_missing_parameters
        render json: { status: 'error', msg: 'missing parameters' }
    end

    def render_wrong_login
        render json: { status: 'error', msg: 'wrong login' }, status: 400
    end

    def render_not_allowed
        render json: { status: 'error', msg: 'You are not allowed to execute this action'}, status: 401
    end

    # Wristbands
    def render_wristband_has_user
        render json: { status: 'error', msg: 'This wristband already belongs to a user' }, status: 401
    end
end
