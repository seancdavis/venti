class ServersController < ApplicationController

  def index
    @server = Server.new
  end

  def edit
  end

  def create
    @server = Server.new(server_params)
    if @server.save
      redirect_to root_path, :notice => 'Server created successfully.'
    else
      render 'index'
    end
  end

  def update
    if server.update(server_params)
      redirect_to root_path, :notice => 'Server updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    server.destroy
    redirect_to root_path, :notice => 'Server deleted successfully.'
  end

  private

    def server_params
      params.require(:server).permit(
        :description,
        :host,
        :host_name,
        :user,
        :port
      ).merge(
        :account => account
      )
    end

end
