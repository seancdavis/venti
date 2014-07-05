module ApplicationHelper

  def accounts
    @accounts ||= Account.all.includes(:servers)
  end

  def account
    @account ||= begin
      if params[:account_id] == 'unattached' || params[:id] == 'unattached'
        return 'unattached'
      end
      Account.find_by_id(params[:id])
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
      Server.find_by_id(params[:id])
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
      "root" => Rails.root,
      "home" => File.expand_path("~"),
    }
  end

end
