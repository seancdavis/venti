class ConfigController < ApplicationController

  def show
    @file_contents = File.read("#{settings['exports']['dir']}/config")
  end

  def update
    require 'rake'
    system "bundle exec rake export:data"
    redirect_to accounts_path
  end

end
