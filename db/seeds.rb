# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# generate random placeholder images

ActiveRecord::Base.transaction do
  User.create(username: "guest", email: "guest@gmail.com", password: "123456", passwordConfirm: "123456")

  Category.create(title: "Exploration", description: "Fund the search for life, new homes, and wonderful things", image_url: "green-nebula.jpg")

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

  Tier.create(project_id: 1, amount: 5, rewards: "bobblehead doll", delivery_date: DateTime.new(rand(2015-2018), rand(8-12), rand(1..30), rand(8..24)))

  Tier.create(project_id: 1, amount: 10, rewards: "plushie", delivery_date: DateTime.new(rand(2015-2018), rand(8-12), rand(1..30), rand(8..24)))

  Tier.create(project_id: 1, amount: 25, rewards: "blaster cannon", delivery_date: DateTime.new(rand(2015-2018), rand(8-12), rand(1..30), rand(8..24)))

  Category.create(title: "Exploitation", description: "Asteroid mining, ice harvesting, solar power, waste disposal", image_url: "Sun-eruption.jpg")

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

  Category.create(title: "Research", description: "Fund the future", image_url: "space-walk.jpg")

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

  Category.create(title: "Colonization", description: "Trillion dollar housing projects", image_url: "iceland-northern-lights.jpg")

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
end
