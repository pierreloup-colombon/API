module DestroyResourceWithStatus
  extend ActiveSupport::Concern

  def destroy_resource(resource)
    resource.status = resource.class.statuses[:deleted]

    if resource.save
      head :no_content
    else
      render_resource_failed(resource)
    end
  end
end
