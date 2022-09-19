class ProductRegisterJob < ApplicationJob
  queue_as :default

  def perform(*args)
      ProductMailer.product_email(args[0][:product_id], args[0][:account_id]).deliver_now
  end
end
