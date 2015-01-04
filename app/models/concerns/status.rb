require 'active_support/concern'

module Status
  extend ActiveSupport::Concern

  included do
    enum status: [:active, :disable]
  end
end
