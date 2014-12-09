class Api::V1::TestController < Api::V1::BaseController
    before_filter :authenticate_user!, only: [:index]

    def index
        render json: { status: 'ok' }
    end
end
