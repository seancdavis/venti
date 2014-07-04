class ServersController < ApplicationController

  def index
    @server = Server.new
  end

  def create
    @server = Server.new(server_params)
    if @server.save
      redirect_to account_servers_path(account), :notice => 'Server created successfully.'
    else
      render 'index'
    end
  end

  private

    def server_params
      params.require(:server).permit(
        :host,
        :host_name,
        :user,
        :port
      ).merge(
        :account => account
      )
    end

end
