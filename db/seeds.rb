# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# placeimg.com
User.create(username: "guest", email: "guest@gmail.com", password: "123456", passwordConfirm: "123456")


# create_table "categories", force: :cascade do |t|
#   t.string   "title",       null: false
#   t.text     "description", null: false
#   t.string   "image_url"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

Category.create(title: "Exploration", description: "Fund the search for life, new homes, and wonderful things", image_url: "green-nebula.jpg")

Project.create(title: "")


Category.create(title: "Exploitation", description: "Asteroid mining, ice harvesting, solar power, waste disposal", image_url: "Sun-eruption.jpg")

Category.create(title: "Research", description: "Fund the future", image_url: "space-walk.jpg")

Category.create(title: "Colonization", description: "Trillion dollar housing projects", image_url: "iceland-northern-lights.jpg")
# create_table "projects", force: :cascade do |t|
#   t.string   "title",       null: false
#   t.text     "description", null: false
#   t.string   "image_url"
#   t.integer  "user_id",     null: false
#   t.integer  "category_id", null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
