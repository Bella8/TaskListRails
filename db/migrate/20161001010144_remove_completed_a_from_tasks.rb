class RemoveCompletedAFromTasks < ActiveRecord::Migration
  def change
    remove_column(:tasks, :completed_a)
  end
end
