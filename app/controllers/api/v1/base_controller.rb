class Api::V1::BaseController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken

    rescue_from CanCan::AccessDenied do |exception|
        render json: { status: 'error', message: 'unauthorized' }, status: 401
    end

    protect_from_forgery with: :null_session
    respond_to :json

    rescue_from ArgumentError do |e|
        render json: { status: 'error', message: e.message}, status: :bad_request
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

    def render_nested_resource_doesnt_exists(resource_name)
        render json: {
            status: 'error',
            errors: ["#{resource_name} doesn't exists."]
        }
    end

    def render_resource_successed(resource)
        render json: {
            status: 'success',
            data: resource.as_json
        }
    end

    def render_resource_failed(resource)
        render json: {
            status: 'error',
            data: resource,
            errors: resource.errors.to_hash.merge(full_messages: resource.errors.full_messages)
        }, status: 403
    end

    # Wristbands
    def render_wristband_has_user
        render json: { status: 'error', msg: 'This wristband already belongs to a user' }, status: 401
    end
end
