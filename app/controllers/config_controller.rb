class ConfigController < ApplicationController

  def update
    require 'rake'
    system "bundle exec rake export:data"
    redirect_to accounts_path
  end

end
