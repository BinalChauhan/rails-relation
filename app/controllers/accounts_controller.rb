class AccountsController < ApplicationController
  def show
    @account = Account.friendly.find_by(slug: params[:id])
  end
  def uploadimage
      @account = Account.friendly.find_by(slug: params[:id])
      respond_to do |format|
      if @account.update(account_pera)
          format.js { redirect_to account_path(@account) }
      else
          render :show, status: :unprocessable_entity
      end
      end
  end

  private
  def account_pera
      params.require(:account).permit(:image)
  end

end
