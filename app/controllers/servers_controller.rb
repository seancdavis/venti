class ServersController < ApplicationController

  def index
    @accounts = Account.all.includes(:servers)
  end

end
