FactoryGirl.define do
	factory :task do

		name {Faker::Name.name}
		description {Faker::Lorem.sentence(rand(2..10))}
		end_date { Time.at((Time.now - 1.week).to_i) }
		start_date { Time.at((end_date - 1.week).to_i) }
		progress { rand(0..100) }
	end
end

def random_date
	end_date = Time.now
	start = (end_date - 1.week).to_i
	Time.at(rand(end_date.to_i - start)) + start
end
