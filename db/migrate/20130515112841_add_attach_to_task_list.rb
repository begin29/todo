class AddAttachToTaskList < ActiveRecord::Migration
  def change
    add_column :task_lists, :attach, :string
  end
end
