# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "news", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "project_id"
    t.string "title", limit: 70, default: "", null: false
    t.string "summary", default: ""
    t.text "description"
    t.integer "author_id", default: 0, null: false
    t.timestamp "created_on"
    t.timestamp "updated_on"
    t.index ["author_id"], name: "index_news_on_author_id"
    t.index ["created_on"], name: "index_news_on_created_on"
    t.index ["project_id"], name: "news_project_id"
  end

  create_table "projects", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.timestamp "created_on"
    t.timestamp "updated_on"
    t.timestamp "deleted_on"
    t.string "identifier"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "login", default: "", null: false
    t.string "firstname", limit: 30, default: "", null: false
    t.string "lastname", default: "", null: false
    t.datetime "last_login_on", precision: nil
    t.timestamp "created_on"
    t.timestamp "updated_on"
    t.timestamp "deleted_on"
  end

end
