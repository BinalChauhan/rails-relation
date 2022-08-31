class AccountsController < ApplicationController
  def show
    @account = Account.find_by(id: params[:id])
  end

end
