class Api::V1::BaseController < ActionController::Base
    protect_from_forgery with: :null_session

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
end
