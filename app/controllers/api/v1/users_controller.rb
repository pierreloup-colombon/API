class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all

    render json: @users.as_json(only: [:id, :email])
  end
end
