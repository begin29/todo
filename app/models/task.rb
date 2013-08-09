class Task < ActiveRecord::Base
  attr_accessible :complete, :description, :end_date, :name, :progress, :start_date, :task_list_id, :user_id, :attach, :delete_attach, :tag_ids
  attr_accessor :delete_attach, :cancan
  validates :description, :end_date, :name, :start_date,  presence: true
  validates :progress, :numericality => { :less_than_or_equal_to => 100 }
  belongs_to :task_list

  has_and_belongs_to_many :tags

  has_attached_file :attach, :styles => { :medium => "300x300>", :small => "100x100" }
  validates_attachment_size :attach, :less_than => 1.megabytes 
  validates_attachment_content_type :attach, :content_type => /image/
  before_validation { attach.clear if delete_attach == '1' }

  scope :scope_progress, ->{ where( "progress > ?", '50') }
  scope :by_complete, -> { where(:complete => false) }
  scope :by_sortable_asc, -> sort { order("#{sort} asc") }
  scope :by_sortable_desc, -> sort { order("#{sort} desc") }
  scope :to_task_list, -> id {where(task_list_id: id)}

  def as_json options = {}
    super(options).merge!(cancan: @cancan)
  end
  
end
