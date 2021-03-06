# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_game_id  (game_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
end
