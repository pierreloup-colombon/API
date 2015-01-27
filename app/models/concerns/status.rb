require 'active_support/concern'

module Status
  extend ActiveSupport::Concern

  included do
    enum status: [:activated, :disabled, :deleted]
  end
end
