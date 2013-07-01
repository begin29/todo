require "spec_helper"

describe User do 

	# it "should return equal ids after by_sortable (asc/desc)" do
	# 	Task.order("id asc").first.id.should == Task.by_sortable_asc(:id).first.id
	# 	Task.order("id desc").first.id.should == Task.by_sortable_desc(:id).first.id
 #  end

  # it { should have_attached_file(:attach) }
  # it { should validate_attachment_content_type(:attach).allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg') }
  # it { should validate_attachment_size(:attach).less_than(1.megabytes) }
  
  it "has correct image style geometry" do
   @task = FactoryGirl.create(:task , attach: File.open(File.join(Rails.root, "/spec/fixtures/files/attach.png")))

   @task.attach.styles.count.should == 2
   @task.attach.styles[:medium].name.should == :medium
   @task.attach.styles[:small].name.should == :small
   
	end

end