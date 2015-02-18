class Wristband < ActiveRecord::Base
    belongs_to :user

    enum money_source: [:ticket_only, :limited_resource, :wallet_without_credit_card, :wallet_without_credit_card]
    enum status: [:enabled, :disabled]
end
