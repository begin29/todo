class TaskList < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :attach, :attach_cache, :remove_attach
  attr_accessor :cancan
  mount_uploader :attach, AttachTlUploader

  validates :description, :name , presence: true
  has_many :tasks, :dependent => :destroy

  scope :by_sortable_asc, -> sort { order("#{sort} asc") }
  scope :by_sortable_desc, -> sort { order("#{sort} desc") }

  def as_json options = {}
    super(options).merge!(cancan: @cancan)
  end
  
end