class Task < ActiveRecord::Base
  attr_accessible :complete, :description, :end_date, :name, :progress, :start_date, :task_list_id, :user_id, :attach, :delete_attach, :tag_ids
  attr_accessor :delete_attach

  validates :description, :end_date, :name, :start_date, presence: true
  validates :progress, :numericality => { :less_than_or_equal_to => 100 }
  belongs_to :task_list

  has_and_belongs_to_many :tags

  has_attached_file :attach, :styles => { :medium => "300x300>", :small => "100x100" } #, :default_url => "/images/no_photo.jpg"
  
  validates_attachment_content_type :attach, :content_type => /image/
  # :size => { :in => 0..1000.kilobytes }

  before_validation { attach.clear if delete_attach == '1' }

  scope :scope_progress, ->{ where( "progress > ?", '50') }
  scope :by_complete, -> { where(:complete => false) }
  scope :by_sortable_asc, -> sort { order("#{sort} asc" ,sort) }
  scope :by_sortable_desc, -> sort { order("#{sort} desc") }
  scope :to_task_list, -> id {where(task_list_id: id)}
  # scope :by_sortable_order, -> order1 { order(order1) }
  # scope :by_sortable_order, -> sort[] { order(sort[0]+' '+sort[1])}
  # scope :by_sortable, lambda {|*args| 
  #   puts 'a'*50
  #   puts args}
  # end
end
