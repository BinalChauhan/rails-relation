# class OmniauthsController < ApplicationController
#     # skip_before_action :verify_authenticity_token
#     def omniauth
#         account = Account.from_omniauth(request.env['omniauth.auth'])
#         p 333333333333
#         p account
#         if account.valid?
#             session[:account_id] = account.id
#             redirect_to root_path(account)
#         else
#             redirect_to new_account_session_path
#         end
#     end
# end
