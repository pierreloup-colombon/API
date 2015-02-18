class Api::V1::WristbandsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [ :create, :add_to_user ]

  def create
    render json: Wristband.create.as_json(root: true, only: [ :id ]), status: :created
  end

  def add_to_user
    @user = current_user || @user = User.find(params[:user_id])

    @wristband = Wristband.find(params[:wristband_id])

    if !@wristband.user?
      @user.add_wristband(@wristband)
    else
      render json: { status: 'error', msg: 'Wristband already assigned' }, status: 400
      return
    end

    render nothing: true, status: :ok
  end
end
