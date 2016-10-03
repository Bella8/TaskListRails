class DeleteColumnStatusFromTasks < ActiveRecord::Migration
  def change
    remove_column(:tasks, :completion_status)
    add_column(:tasks, :completed, :boolean)
  end

end
