class Api::V1::WristbandsController < Api::V1::BaseController
    def add_to_user
        Rails.logger.info current_user.id
        if params[:user_id].to_i == current_user.id
            @wristband = Wristband.find_by(id: params[:id].to_i)

            if @wristband.has_user?
                render_wristband_has_user and return
            end

            current_user.wristbands << @wristband

            render nothing: true, status: :ok
        else
            render_not_allowed
        end
    end
end
