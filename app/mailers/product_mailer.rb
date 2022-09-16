class ProductMailer < ApplicationMailer

    def product_email(product_id, account_id)
        @product = Product.find_by(id: product_id)
        @account = Account.find_by(id: account_id)
        mail(to: @account.email, subject: 'Welcome to My site.')
    end
end
