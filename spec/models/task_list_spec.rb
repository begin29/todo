require "spec_helper"
require 'carrierwave/test/matchers'

describe TaskList do
	include CarrierWave::Test::Matchers
		before :each do
			AttachTlUploader.enable_processing = true
			@tasklist = FactoryGirl.create(:task_list)
    end

    after do
	    AttachTlUploader.enable_processing = false
	    @tasklist.attach.remove!
  	end

		it { should have_many (:tasks) }

		describe "scopes by_sortable asc and desc" do
			TaskList.by_sortable_asc(:id).first.id.should == TaskList.order("id asc").first.id.should
			TaskList.by_sortable_desc(:id).first.id.should == TaskList.order("id desc").first.id.should
		end
		
		it "should no lardet that 50 x 50" do
      @tasklist.attach.small.should be_no_larger_than(50, 50)  
    end 

    it "should equals errors messages" do
    	@tasklist2 = FactoryGirl.build(:task_list, name: "", description: "")
    	@count = TaskList.all.count

			unless @tasklist2.save
				flag = @tasklist2.errors.full_messages[0] <=> "Description can't be blank"
				flag.should == 0
				flag = @tasklist2.errors.full_messages[1] <=> "Name can't be blank"
				flag.should == 0
				@count.should == TaskList.all.count
			end
    end
end
