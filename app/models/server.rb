# == Schema Information
#
# Table name: servers
#
#  id          :integer          not null, primary key
#  host        :string(255)
#  host_name   :string(255)
#  user        :string(255)
#  port        :string(255)
#  account_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class Server < ActiveRecord::Base

  # ------------------------------------------ Associations

  belongs_to :account

  # ------------------------------------------ Scopes

  default_scope { order('host asc') }

end
