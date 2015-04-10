# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# generate random placeholder images



User.create(username: "guest", email: "guest@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Jane", email: "jane@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Frank", email: "frank@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "John", email: "john@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Robert", email: "robert@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Susan", email: "susan@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Jim", email: "jim@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Ryan", email: "ryan@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Carlos", email: "carlos@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Kelly", email: "kelly@gmail.com", password: "123456", passwordConfirm: "123456")
User.create(username: "Kathryn", email: "kathryn@gmail.com", password: "123456", passwordConfirm: "123456")

num_users = User.all.length

Category.create(title: "Exploration", description: "Fund the search for life, new homes, and wonderful things", image_url: "green-nebula.jpg")

Category.create(title: "Exploitation", description: "Asteroid mining, ice harvesting, solar power, waste disposal", image_url: "Sun-eruption.jpg")

Category.create(title: "Research", description: "Fund the future", image_url: "space-walk.jpg")

Category.create(title: "Colonization", description: "Trillion dollar housing projects", image_url: "iceland-northern-lights.jpg")

num_categories = Category.all.length

Project.create(title: "Land on the moon",
               description: "Its been awhile",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 1, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Visit Pluto",
               description: "Don't even care that its not a planet.",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 1, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Alpha Centauri Project",
               description: "It will take a bit to get there",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 1, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Asteroid Mining",
               description: "No one uses them anyways",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 2, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Ice Harvesting",
               description: "Free water.",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 2, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Solar Power",
               description: "Satellites and absurd sun beams",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 2, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "X-483 Project",
               description: "build a better spaceship",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 3, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Orion Project",
               description: "Nuclear bomb powered propulsion.  What could go wrong?",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 3, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Solar Sail",
               description: "The green side of things",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 3, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Colonize Mars",
               description: "Start a bio dome",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 4, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Colonize the Moon",
               description: "Build a city",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 4, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

Project.create(title: "Colonize Space",
               description: "Think the Death Star without a laser",
               image_url: ('placeimg.com/640/480/tech?' + SecureRandom.hex(3).to_s),
               user_id: 1, category_id: 4, end_date: DateTime.new(2015, 5, rand(1..30), rand(8..24)))

num_projects = Project.all.length

tier_amounts = [1, 5, 10, 25, 50, 75, 100, 500, 1000, 2500, 10000];
tier_rewards = ['bobblehead doll', 'plushie', 'poster', 'spacesuit', 'trip to launch site', 'dinner with the designers', "CEO's autograph", 'etched rolex', 'moon rocks', 'watch operations from the command room', 'virtual high-five']
tier_user_ids = (1..num_users).to_a
Project.all.each do |project|
  num_tiers = rand(3..8)
  tier_amount_values = tier_amounts.sample(num_tiers)
  tier_reward_values = tier_rewards.sample(num_tiers)
  tier_backers = tier_user_ids.sample(3)
  num_tiers.times do |i|
    tier = Tier.create(project_id: project.id, amount: tier_amount_values[i], rewards: tier_reward_values[i], delivery_date: DateTime.new(rand(2015..2018), rand(8..12), rand(1..30), rand(8..24)))
    tier_backers.each do |backer|
      Pledge.create(user_id: backer, tier_id: tier.id)
    end
  end
end
