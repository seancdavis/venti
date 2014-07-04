class AccountsController < ApplicationController

  def index
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path, :notice => 'Account created successfully.'
    else
      render 'index'
    end
  end

  private

    def account_params
      params.require(:account).permit(:name)
    end

end
