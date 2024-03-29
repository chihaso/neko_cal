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

ActiveRecord::Schema[7.0].define(version: 2023_03_17_224903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_contents_on_subject_id"
  end

  create_table "recording_method_binaries", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.string "truth_label", null: false, comment: "真のラベル"
    t.string "false_label", null: false, comment: "偽のラベル"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_recording_method_binaries_on_content_id"
  end

  create_table "recording_method_multi_levels", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.string "right_end_label", null: false, comment: "右端のラベル"
    t.string "left_end_label", null: false, comment: "左端のラベル"
    t.integer "level", null: false, comment: "段階数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_recording_method_multi_levels_on_content_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "cat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_subjects_on_cat_id"
  end

  add_foreign_key "contents", "subjects"
  add_foreign_key "recording_method_binaries", "contents"
  add_foreign_key "recording_method_multi_levels", "contents"
  add_foreign_key "subjects", "cats"
end
