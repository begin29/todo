FactoryGirl.define do
	factory :task_list do
		name {Faker::Name.name}
		description {Faker::Lorem.sentence(rand(2..10))}
		attach {File.open(File.join(Rails.root, "/spec/fixtures/files/attach.png"))}
	end
end