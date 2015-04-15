# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# generate random placeholder images

User.create(username: "dan", email: "dan@gmail.com", password: "password", passwordConfirm: "password")
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
num_categories = Category.all.length

Project.create!([
  {title: "Land on the moon",
   description: "It has been far too long since man has walked on the moon",
   end_date: "2015-05-06 00:00:00",
   goal: 10000000,
   user_id: 1,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 105149,
   main_photo_updated_at: "2015-04-15 16:09:30"},
  {title: "Visit Pluto",
   description: "It may no longer be a planet,
   but we will never forget it.",
   end_date: "2015-05-01 00:00:00",
   goal: 100000000,
   user_id: 1,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 91481,
   main_photo_updated_at: "2015-04-15 16:29:25"},
  {title: "Alpha Centauri Project",
   description: "A one way trip to another star.",
   end_date: "2015-04-29 00:00:00",
   goal: 100000000,
   user_id: 1,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1351345,
   main_photo_updated_at: "2015-04-15 16:36:44"},
  {title: "Asteroid Mining",
   description: "No one uses them anyways.",
   end_date: "2015-05-12 00:00:00",
   goal: 3000000,
   user_id: 1,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 863903,
   main_photo_updated_at: "2015-04-15 16:38:09"},
  {title: "Ice Harvesting",
   description: "Free water.",
   end_date: "2015-05-07 00:00:00",
   goal: 73000000,
   user_id: 1,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1452501,
   main_photo_updated_at: "2015-04-15 16:40:31"},
  {title: "Solar Power",
   description: "Satellites will collect free solar energy and transfer it to receptacles all over Earth.",
   end_date: "2015-05-08 00:00:00",
   goal: 18000000,
   user_id: 1,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1553288,
   main_photo_updated_at: "2015-04-15 16:44:35"},
  {title: "X-483 Project",
   description: "Build a better spaceship.",
   end_date: "2015-05-04 00:00:00",
   goal: 300000000,
   user_id: 1,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1011351,
   main_photo_updated_at: "2015-04-15 16:59:50"},
  {title: "Orion Project",
   description: "Nuclear bomb powered propulsion.  What could go wrong?",
   end_date: "2015-05-28 00:00:00",
   goal: 73000000,
   user_id: 1,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1538159,
   main_photo_updated_at: "2015-04-15 17:01:04"},
  {title: "Solar Sail",
   description: "The green side of things.",
   end_date: "2015-05-20 00:00:00",
   goal: 78000000,
   user_id: 1,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1391252,
   main_photo_updated_at: "2015-04-15 17:02:05"},
  {title: "Colonize Mars",
   description: "A little terraforming will go a long way.",
   end_date: "2015-05-01 00:00:00",
   goal: 500000000,
   user_id: 1,
   category_id: 4,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 729793,
   main_photo_updated_at: "2015-04-15 17:11:25"},
  {title: "Colonize the Moon",
   description: "We may botch Earth at some point.",
   end_date: "2015-05-07 00:00:00",
   goal: 5000000000,
   user_id: 1,
   category_id: 4,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 967389,
   main_photo_updated_at: "2015-04-15 17:13:41"},
  {title: "Colonize Space",
   description: "Theres a lot of it.",
   end_date: "2015-07-04 00:00:00",
   goal: 750000000,
   user_id: 1,
   category_id: 4,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 678436,
   main_photo_updated_at: "2015-04-15 17:16:16"}
])


num_projects = Project.all.length

tier_amounts = [1000, 5000, 10000, 25000, 50000, 75000, 100000, 500000, 1000000, 2500000, 10000000];
tier_rewards = ['bobblehead doll', 'plushie', 'poster', 'spacesuit', 'trip to launch site', 'dinner with the designers', "CEO's autograph", 'etched rolex', 'moon rocks', 'watch operations from the command room', 'virtual high-five']
Project.all.each do |project|
  tier_user_ids = (1..num_users).to_a.shuffle!
  num_tiers = rand(3..8)
  tier_amount_values = tier_amounts.sample(num_tiers)
  tier_reward_values = tier_rewards.sample(num_tiers)
  max_backers = num_users/num_tiers;
  num_tiers.times do |i|
    tier = Tier.create(project_id: project.id, amount: tier_amount_values[i], rewards: tier_reward_values[i], delivery_date: DateTime.new(rand(2015..2018), rand(8..12), rand(1..30), rand(8..24)))
    tier_backers = tier_user_ids.take(rand(0..max_backers))
    tier_user_ids = tier_user_ids.drop(tier_backers.length)
    tier_backers.each do |backer|
      Pledge.create(user_id: backer, tier_id: tier.id)
    end
  end
end
