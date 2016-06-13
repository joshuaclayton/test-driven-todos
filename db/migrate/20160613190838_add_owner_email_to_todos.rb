class AddOwnerEmailToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :owner_email, :string, null: false, default: ""
    add_index :todos, :owner_email
  end
end
