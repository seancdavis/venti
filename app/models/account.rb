# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base

  # ------------------------------------------ Associations

  has_many :servers

  # ------------------------------------------ Scopes

  default_scope { order('name asc') }

  # ------------------------------------------ Vaidations

  validates :name, :presence => true

end
