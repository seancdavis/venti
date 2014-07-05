class AccountsController < ApplicationController

  def index
    @account = Account.new
    @server = Server.new
  end

  def show
    @server = Server.new
  end

  def edit
    @account = account
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to root_path, :notice => 'Account created successfully.'
    else
      render 'index'
    end
  end

  def update
    @account = account
    if @account.update(account_params)
      redirect_to root_path, :notice => 'Account updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    account.destroy
    redirect_to root_path, :notice => 'Account (and its servers) deleted successfully.'
  end

  private

    def account_params
      params.require(:account).permit(:name)
    end

end
