class AddUserIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :user,type: :integer
  end
end
