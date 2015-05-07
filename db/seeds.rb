# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# generate random placeholder images

User.create(username: "Dan", email: "Dan@gmail.com", password: "password", passwordConfirm: "password")
User.create(username: "Guest", email: "Guest@gmail.com", password: "password", passwordConfirm: "password")

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
   description: "It has been far too long since man has walked on the moon.",
   end_date: "2015-05-06 00:00:00",
   goal: 10000000,
   user_id: 1,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 369738,
   main_photo_updated_at: "2015-04-15 21:27:12"},
  {title: "Visit Pluto",
   description: "It may no longer be a planet,
   but we will never forget it.",
   end_date: "2015-06-01 00:00:00",
   goal: 100000000,
   user_id: 2,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 91481,
   main_photo_updated_at: "2015-04-15 16:29:25"},
  {title: "Alpha Centauri Project",
   description: "A one way trip to another star.",
   end_date: "2015-06-29 00:00:00",
   goal: 100000000,
   user_id: 1,
   category_id: 1,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1351345,
   main_photo_updated_at: "2015-04-15 16:36:44"},
  {title: "Asteroid Mining",
   description: "No one uses them anyways.",
   end_date: "2015-06-12 00:00:00",
   goal: 3000000,
   user_id: 1,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 863903,
   main_photo_updated_at: "2015-04-15 16:38:09"},
  {title: "Ice Harvesting",
   description: "Free water.",
   end_date: "2015-06-07 00:00:00",
   goal: 73000000,
   user_id: 2,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1452501,
   main_photo_updated_at: "2015-04-15 16:40:31"},
  {title: "Solar Power",
   description: "Satellites will collect free solar energy and transfer it to receptacles all over Earth.",
   end_date: "2015-06-08 00:00:00",
   goal: 18000000,
   user_id: 1,
   category_id: 2,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1553288,
   main_photo_updated_at: "2015-04-15 16:44:35"},
  {title: "X-483 Project",
   description: "Build a better spaceship.",
   end_date: "2015-06-04 00:00:00",
   goal: 300000000,
   user_id: 1,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1011351,
   main_photo_updated_at: "2015-04-15 16:59:50"},
  {title: "Project Orion",
   description: "Nuclear bomb powered propulsion.  What could go wrong?",
   end_date: "2015-06-28 00:00:00",
   goal: 73000000,
   user_id: 2,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1538159,
   main_photo_updated_at: "2015-04-15 17:01:04"},
  {title: "Solar Sail",
   description: "The green side of things.",
   end_date: "2015-06-20 00:00:00",
   goal: 78000000,
   user_id: 1,
   category_id: 3,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 1391252,
   main_photo_updated_at: "2015-04-15 17:02:05"},
  {title: "Colonize Mars",
   description: "A little terraforming will go a long way.",
   end_date: "2015-06-01 00:00:00",
   goal: 500000000,
   user_id: 1,
   category_id: 4,
   main_photo_file_name: "data",
   main_photo_content_type: "image/jpeg",
   main_photo_file_size: 729793,
   main_photo_updated_at: "2015-04-15 17:11:25"},
  {title: "Colonize the Moon",
   description: "We may botch Earth at some point.",
   end_date: "2015-06-07 00:00:00",
   goal: 5000000000,
   user_id: 2,
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

Project.all.each do |project|
  15.times do
    num = rand(1..4)
    case num
    when 1
      Comment.create(user_id: 1, project_id: project.id, body: Faker::Hacker.say_something_smart)
    when 2
      Comment.create(user_id: 2, project_id: project.id, body: Faker::Hacker.say_something_smart)
    when 3..4
      Comment.create(user_id: rand(3..num_users), project_id: project.id, body: Faker::Hacker.say_something_smart)
    end
  end
end
Photo.create!([
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 125857, sub_photo_updated_at: "2015-04-20 19:27:28", project_id: 2},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 544815, sub_photo_updated_at: "2015-04-20 19:27:46", project_id: 2},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 220912, sub_photo_updated_at: "2015-04-20 19:28:16", project_id: 2},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 32727, sub_photo_updated_at: "2015-04-20 19:28:34", project_id: 2},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 89104, sub_photo_updated_at: "2015-04-20 19:28:43", project_id: 2},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 371933, sub_photo_updated_at: "2015-04-20 19:29:04", project_id: 5},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 674013, sub_photo_updated_at: "2015-04-20 19:29:18", project_id: 5},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/png", sub_photo_file_size: 772862, sub_photo_updated_at: "2015-04-20 19:29:39", project_id: 5},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1149986, sub_photo_updated_at: "2015-04-20 19:29:58", project_id: 5},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1838375, sub_photo_updated_at: "2015-04-20 19:30:24", project_id: 5},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 112621, sub_photo_updated_at: "2015-04-20 19:31:10", project_id: 8},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 113618, sub_photo_updated_at: "2015-04-20 19:31:20", project_id: 8},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 220912, sub_photo_updated_at: "2015-04-20 19:31:32", project_id: 8},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 32727, sub_photo_updated_at: "2015-04-20 19:31:43", project_id: 8},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 97845, sub_photo_updated_at: "2015-04-20 19:31:53", project_id: 8},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 454888, sub_photo_updated_at: "2015-04-20 19:32:14", project_id: 11},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 311263, sub_photo_updated_at: "2015-04-20 19:32:29", project_id: 11},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 22898, sub_photo_updated_at: "2015-04-20 19:32:42", project_id: 11},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/png", sub_photo_file_size: 1164920, sub_photo_updated_at: "2015-04-20 19:32:51", project_id: 11},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1654335, sub_photo_updated_at: "2015-04-20 19:33:12", project_id: 11},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 484595, sub_photo_updated_at: "2015-04-20 19:49:17", project_id: 3},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 4078407, sub_photo_updated_at: "2015-04-20 19:49:32", project_id: 3},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 570818, sub_photo_updated_at: "2015-04-20 19:50:00", project_id: 3},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 348593, sub_photo_updated_at: "2015-04-20 19:50:17", project_id: 3},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 278410, sub_photo_updated_at: "2015-04-20 19:50:31", project_id: 3},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 656833, sub_photo_updated_at: "2015-04-20 19:50:56", project_id: 10},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 276358, sub_photo_updated_at: "2015-04-20 19:51:13", project_id: 10},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 3224685, sub_photo_updated_at: "2015-04-20 19:51:25", project_id: 10},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 2771091, sub_photo_updated_at: "2015-04-20 19:51:51", project_id: 10},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 263380, sub_photo_updated_at: "2015-04-20 19:52:16", project_id: 10},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 525780, sub_photo_updated_at: "2015-04-20 19:52:44", project_id: 12},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 355477, sub_photo_updated_at: "2015-04-20 19:52:57", project_id: 12},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 394605, sub_photo_updated_at: "2015-04-20 19:53:09", project_id: 12},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 172160, sub_photo_updated_at: "2015-04-20 19:53:21", project_id: 12},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1089133, sub_photo_updated_at: "2015-04-20 19:53:34", project_id: 12},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1924342, sub_photo_updated_at: "2015-04-20 19:57:38", project_id: 1},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 154490, sub_photo_updated_at: "2015-04-20 19:58:03", project_id: 1},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 553972, sub_photo_updated_at: "2015-04-20 19:58:15", project_id: 1},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 2682611, sub_photo_updated_at: "2015-04-20 19:58:27", project_id: 1},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 8663377, sub_photo_updated_at: "2015-04-20 19:58:54", project_id: 1},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 397275, sub_photo_updated_at: "2015-04-20 20:16:38", project_id: 6},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 1385523, sub_photo_updated_at: "2015-04-20 20:16:53", project_id: 6},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 284201, sub_photo_updated_at: "2015-04-20 20:17:12", project_id: 6},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 66618, sub_photo_updated_at: "2015-04-20 20:18:49", project_id: 6},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 929777, sub_photo_updated_at: "2015-04-20 20:19:02", project_id: 6},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 783904, sub_photo_updated_at: "2015-04-20 20:19:26", project_id: 4},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 2572683, sub_photo_updated_at: "2015-04-20 20:19:42", project_id: 4},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 491702, sub_photo_updated_at: "2015-04-20 20:20:24", project_id: 4},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 270241, sub_photo_updated_at: "2015-04-20 20:20:44", project_id: 4},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 5724138, sub_photo_updated_at: "2015-04-20 20:20:59", project_id: 4},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 95152, sub_photo_updated_at: "2015-04-20 20:28:09", project_id: 7},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 223640, sub_photo_updated_at: "2015-04-20 20:28:24", project_id: 7},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 370811, sub_photo_updated_at: "2015-04-20 20:28:37", project_id: 7},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 107821, sub_photo_updated_at: "2015-04-20 20:28:51", project_id: 7},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 320631, sub_photo_updated_at: "2015-04-20 20:29:04", project_id: 7},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 397275, sub_photo_updated_at: "2015-04-20 20:29:21", project_id: 9},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 448360, sub_photo_updated_at: "2015-04-20 20:35:05", project_id: 9},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 6691821, sub_photo_updated_at: "2015-04-20 20:35:22", project_id: 9},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 577888, sub_photo_updated_at: "2015-04-20 20:35:51", project_id: 9},
  {sub_photo_file_name: "data", sub_photo_content_type: "image/jpeg", sub_photo_file_size: 545893, sub_photo_updated_at: "2015-04-20 20:36:14", project_id: 9}
])
      
