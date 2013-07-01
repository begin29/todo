FactoryGirl.define do
	factory :user do
		name {Faker::Name.name}
		email {Faker::Internet.email}
		password {Faker::Lorem.sentence(word_count = 2)}
	end
end