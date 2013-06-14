require "spec_helper"

describe Tag do 

	it { should have_and_belong_to_many (:tasks) }
	
	it "should show name validate error" do 
		@tag = FactoryGirl.build(:tag, name: "")
		@count = Tag.all.count

		unless @tag.save
			flag = @tag.errors.full_messages[0] <=> "Name can't be blank"
			flag.should == 0
			@count.should == Tag.all.count
		end
	end

end
