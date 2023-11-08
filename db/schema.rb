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

ActiveRecord::Schema[7.0].define(version: 2023_10_29_162558) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer "number"
    t.bigint "suit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bid_type_id"
    t.index ["suit_id"], name: "index_bids_on_suit_id"
  end

  create_table "bids_situations", id: false, force: :cascade do |t|
    t.bigint "bid_id", null: false
    t.bigint "situation_id", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "suit_id", null: false
    t.bigint "value_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suit_id"], name: "index_cards_on_suit_id"
    t.index ["value_id"], name: "index_cards_on_value_id"
  end

  create_table "choices", force: :cascade do |t|
    t.boolean "correct"
    t.bigint "situation_id", null: false
    t.bigint "statement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["situation_id"], name: "index_choices_on_situation_id"
    t.index ["statement_id"], name: "index_choices_on_statement_id"
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "standard_id", null: false
    t.index ["standard_id"], name: "index_courses_on_standard_id"
  end

  create_table "hand_cards", force: :cascade do |t|
    t.bigint "hand_id", null: false
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_hand_cards_on_card_id"
    t.index ["hand_id"], name: "index_hand_cards_on_hand_id"
  end

  create_table "hands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hp"
    t.boolean "balanced"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "situation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequence"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["situation_id"], name: "index_lessons_on_situation_id"
  end

  create_table "situations", force: :cascade do |t|
    t.bigint "hand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summary"
    t.text "intro"
    t.index ["hand_id"], name: "index_situations_on_hand_id"
  end

  create_table "standards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statements", force: :cascade do |t|
    t.string "convention"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suits", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short"
  end

  create_table "values", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.string "short"
  end

  add_foreign_key "bids", "suits"
  add_foreign_key "cards", "suits"
  add_foreign_key "cards", "values"
  add_foreign_key "choices", "situations"
  add_foreign_key "choices", "statements"
  add_foreign_key "courses", "standards"
  add_foreign_key "hand_cards", "cards"
  add_foreign_key "hand_cards", "hands"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "situations"
  add_foreign_key "situations", "hands"
end
