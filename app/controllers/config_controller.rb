class ConfigController < ApplicationController

  def show
    @file = "#{settings['exports']['dir']}/config"
    update unless File.exist?(@file)
  end

  def update
    require 'rake'
    rake_task = try do
      system("bundle exec rake export:config")
    end
    if rake_task == true
      redirect_to config_path, :notice => 'Config updated successfully.'
    else
      redirect_to config_path, :alert => 'There was a problem updating your config file.'
    end
  end

end
