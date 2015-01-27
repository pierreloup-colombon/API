class Api::V1::TestController < Api::V1::BaseController
    before_filter :authenticate_user!
    load_and_authorize_resource class: false

    def index
        render json: { status: 'ok' }
    end
end
