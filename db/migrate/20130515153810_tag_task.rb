class TagTask < ActiveRecord::Migration
  def up
  	 create_table 'tags_tasks', :id => false do |t|
    t.column :tag_id, :integer
    t.column :task_id, :integer
  	end
  end

  def down
  	drop_table 'tags_tasks'
  end
end
