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

require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
