class AddBoardIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :board,type: :integer
  end
end
