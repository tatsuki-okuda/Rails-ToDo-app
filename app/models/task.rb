# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text
#  deadline   :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#
class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :deadline, presence: true

  belongs_to :board
end
