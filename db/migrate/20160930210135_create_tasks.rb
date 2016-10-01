class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :completion_status
      t.datetime :completed_a

      t.timestamps null: false
    end
  end
end
