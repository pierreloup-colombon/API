require 'active_support/concern'

module Status
  extend ActiveSupport::Concern

  included do
    enum status: [:actived, :disabled, :deleted]
  end
end
