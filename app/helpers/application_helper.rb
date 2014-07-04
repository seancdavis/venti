module ApplicationHelper

  def accounts
    @accounts ||= Account.all.includes(:servers)
  end

  def account
    @account ||= Account.find(params[:account_id])
  end

  def servers
    @servers ||= account.servers
  end

  # def breadcrumbs
  #   raise request.fullpath.split('/').inspect
  # end

end
