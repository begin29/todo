class TaskList < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :attach, :attach_cache, :remove_attach

  mount_uploader :attach, AttachTlUploader

  validates :description, :name , presence: true
  has_many :tasks, :dependent => :destroy
  
  scope :by_sortable_asc, -> sort { order(sort+' asc') }
  scope :by_sortable_desc, -> sort { order(sort+' desc') }
  # scope :will_paginate, -> page { paginate( :per_page => 20, :page => page ) }
end