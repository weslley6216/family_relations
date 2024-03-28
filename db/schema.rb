ActiveRecord::Schema[7.0].define(version: 2024_03_28_005617) do
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.bigint "mother_id"
    t.bigint "father_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["father_id"], name: "index_people_on_father_id"
    t.index ["mother_id"], name: "index_people_on_mother_id"
  end

  add_foreign_key "people", "people", column: "father_id"
  add_foreign_key "people", "people", column: "mother_id"
end
