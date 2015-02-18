class Wristband < ActiveRecord::Base
  belongs_to :wallet

  enum money_source: [:ticket_only, :limited_resource, :wallet_without_credit_card, :wallet_with_credit_card]
  enum status: [:enabled, :disabled]

  def user?
    self.wallet_id.not_nil?
  end
end
