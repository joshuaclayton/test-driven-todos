class AddCompletedAtToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :completed_at, :timestamp
    add_index :todos, :completed_at
  end
end
