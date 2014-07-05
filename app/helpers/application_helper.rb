module ApplicationHelper

  def accounts
    @accounts ||= Account.all.includes(:servers)
  end

  def account
    @account ||= begin
      if params[:account_id] == 'unattached' || params[:id] == 'unattached'
        return 'unattached'
      end
      account = Account.find_by_id(params[:account_id])
      account = Account.find_by_id(params[:id]) if account.nil?
      account
    end
  end

  def servers
    @servers ||= begin
      if account == 'unattached'
        unattached_servers
      else
        account.servers
      end
    end
  end

  def server
    @server ||= begin
      server = Server.find_by_id(params[:server_id])
      server = Server.find_by_id(params[:id]) if server.nil?
      server
    end
  end

  def unattached_servers
    @unattached_servers ||= Server.unattached
  end

  def settings
    @settings ||= begin
      require 'json'
      settings = File.read("#{Rails.root}/config/settings.json")
      replace_settings.each do |k,v|
        settings.gsub!(/\%\{#{k}\}/, v)
      end
      JSON.parse(settings)
    end
  end

  def replace_settings
    {
      "root" => "#{Rails.root}",
      "home" => File.expand_path("~"),
    }
  end

end
