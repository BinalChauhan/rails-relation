class AccountsController < ApplicationController
  def show
    @account = Account.friendly.find_by(slug: params[:id])
  end

end
