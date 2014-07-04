class ConfigController < ApplicationController

  def show
    @file = "#{settings['exports']['dir']}/config"
    update unless File.exist?(@file)
  end

  def update
    require 'rake'
    system "bundle exec rake export:data"
    redirect_to config_path
  end

end
