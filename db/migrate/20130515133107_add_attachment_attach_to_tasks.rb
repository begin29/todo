class AddAttachmentAttachToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :attach
    end
  end

  def self.down
    drop_attached_file :tasks, :attach
  end
end
