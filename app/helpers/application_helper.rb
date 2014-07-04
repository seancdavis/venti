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

  def settings
    @settings ||= begin
      require 'json'
      settings = File.read("#{Rails.root}/config/settings.json")
      JSON.parse(settings)
    end
  end

end
