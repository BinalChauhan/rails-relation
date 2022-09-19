class AccountRegisterMailer < ApplicationMailer

    def account_email(account)
        @account = account
        mail(to: "nidhi@gmail.com", subject: 'You have successfully register.')
    end
end
