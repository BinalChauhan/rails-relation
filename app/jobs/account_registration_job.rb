class AccountRegistrationJob < ApplicationJob
  queue_as :default

  def initialize(account)
      @account = account
  end

  def perform
    AccountRegisterMailer.account_email(@account).deliver
  end
end
