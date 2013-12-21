class AddCompletedToTaskEntry < ActiveRecord::Migration
  def change
    add_column :task_entries, :completed, :boolean, default: false
  end
end
