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
      replace_settings.each do |k,v|
        settings.gsub!(/\%\{#{k}\}/, v)
      end
      JSON.parse(settings)
    end
  end

  def replace_settings
    {
      "root" => "#{Rails.root}"
    }
  end

end
