class CreateTaskEntries < ActiveRecord::Migration
  def change
    create_table :task_entries do |t|
      t.text :description

      t.timestamps
    end
  end
end
