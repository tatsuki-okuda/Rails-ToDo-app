# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user

  has_many :tasks, dependent: :destroy

  
end
