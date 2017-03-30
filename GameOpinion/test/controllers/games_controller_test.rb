# == Schema Information
#
# Table name: games
#
#  id                 :integer          not null, primary key
#  title              :string
#  image              :string
#  description        :string
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_games_on_user_id  (user_id)
#

require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
