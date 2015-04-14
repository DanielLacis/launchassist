# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# generate random placeholder images

User.create(username: "guest", email: "guest@gmail.com", password: "123456", passwordConfirm: "123456")

150.times do
  name = Faker::Name.first_name
  email = Faker::Internet.email(name)
  User.create(username: name, email: email, password: 'password', passwordConfirm: 'password')
end

num_users = User.all.length

Category.create(title: "Exploration", description: "Fund the search for life, new homes, and wonderful things", image_url_index: "https://s3.amazonaws.com/launchassist/category-images/category-index-exploration.jpg", image_url_show: "https://s3.amazonaws.com/launchassist/category-images/category-show-exploration.jpg")
#
Category.create(title: "Exploitation", description: "Asteroid mining, ice harvesting, solar power, waste disposal", image_url_index: "https://s3.amazonaws.com/launchassist/category-images/category-index-exploitation.jpg", image_url_show: "https://s3.amazonaws.com/launchassist/category-images/category-show-exploitation.jpg")

Category.create(title: "Research", description: "Fund the future", image_url_index: "https://s3.amazonaws.com/launchassist/category-images/category-index-research.jpg", image_url_show: "https://s3.amazonaws.com/launchassist/category-images/category-show-research.jpg")

Category.create(title: "Colonization", description: "Trillion dollar housing projects", image_url_index: "https://s3.amazonaws.com/launchassist/category-images/category-index-colonization.jpg", image_url_show: "https://s3.amazonaws.com/launchassist/category-images/category-show-colonization.jpg")
#
# num_categories = Category.all.length
#
# Project.create(title: "Land on the moon",
#                description: "Its been awhile",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 1, goal: 10000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Visit Pluto",
#                description: "Don't even care that its not a planet.",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 1, goal: 100000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Alpha Centauri Project",
#                description: "It will take a bit to get there",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 1, goal: 5000000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Asteroid Mining",
#                description: "No one uses them",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 2, goal: 3000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Ice Harvesting",
#                description: "Free water.",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 2, goal: 73000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Solar Power",
#                description: "Satellites and absurd sun beams",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 2, goal: 1800000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "X-483 Project",
#                description: "build a better spaceship",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 3, goal: 1000000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Orion Project",
#                description: "Nuclear bomb powered propulsion.  What could go wrong?",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 3, goal: 33000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Solar Sail",
#                description: "The green side of things",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 3, goal: 780000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Colonize Mars",
#                description: "Start a bio dome",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 4, goal: 243000000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Colonize the Moon",
#                description: "Build a city",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 4, goal: 1200000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# Project.create(title: "Colonize Space",
#                description: "Think the Death Star without a laser",
#                image_url: ('http://placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
#                user_id: 1, category_id: 4, goal: 90000000000, end_date: DateTime.new(2015, 5, rand(1..8), rand(8..24)))
#
# num_projects = Project.all.length
#
# tier_amounts = [1000, 5000, 10000, 25000, 50000, 75000, 100000, 500000, 1000000, 2500000, 10000000];
# tier_rewards = ['bobblehead doll', 'plushie', 'poster', 'spacesuit', 'trip to launch site', 'dinner with the designers', "CEO's autograph", 'etched rolex', 'moon rocks', 'watch operations from the command room', 'virtual high-five']
# Project.all.each do |project|
#   tier_user_ids = (1..num_users).to_a.shuffle!
#   num_tiers = rand(3..8)
#   tier_amount_values = tier_amounts.sample(num_tiers)
#   tier_reward_values = tier_rewards.sample(num_tiers)
#   max_backers = num_users/num_tiers;
#   num_tiers.times do |i|
#     tier = Tier.create(project_id: project.id, amount: tier_amount_values[i], rewards: tier_reward_values[i], delivery_date: DateTime.new(rand(2015..2018), rand(8..12), rand(1..30), rand(8..24)))
#     tier_backers = tier_user_ids.take(rand(0..max_backers))
#     tier_user_ids = tier_user_ids.drop(tier_backers.length)
#     tier_backers.each do |backer|
#       Pledge.create(user_id: backer, tier_id: tier.id)
#     end
#   end
# end
