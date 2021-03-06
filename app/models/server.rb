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
  scope :unattached, -> { where("account_id IS NULL") }

  # ------------------------------------------ Validations

  validates :host, :host_name, :user, :presence => true

  # ------------------------------------------ Instance Methods

  def host_name_with_port
    if port.blank?
      host_name
    else
      "#{host_name}:#{port}"
    end
  end

end
