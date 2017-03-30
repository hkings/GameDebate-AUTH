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

class Game < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { medium: "584x500>", thumb: "300x300>"}
  validates :title, presence: true
  validates :description, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
