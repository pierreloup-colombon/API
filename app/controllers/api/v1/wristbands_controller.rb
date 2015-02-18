class Api::V1::WristbandsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [ :create ]

  def create
    render json: Wristband.create.as_json(root: true, only: [ :id ])
  end
end
