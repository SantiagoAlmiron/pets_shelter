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

ActiveRecord::Schema[7.1].define(version: 2025_07_29_235839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "adoptions", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "user_id", null: false
    t.string "type"
    t.jsonb "adopter_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_adoptions_on_pet_id"
    t.index ["user_id"], name: "index_adoptions_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "surname", limit: 50
    t.string "gender", limit: 20
    t.date "birth_date"
    t.string "birth_state", limit: 100
    t.string "phone", limit: 20
    t.string "dni", limit: 20
    t.string "street_name", limit: 100
    t.string "street_number", limit: 10
    t.string "apartment", limit: 10
    t.string "floor", limit: 10
    t.string "city", limit: 100
    t.string "postal_code", limit: 10
    t.boolean "accepted_terms", default: false, null: false
    t.boolean "has_other_pets", default: false, null: false
    t.boolean "has_children", default: false, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dni"], name: "index_identities_on_dni", unique: true
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.text "about_pet"
    t.text "physical_characteristics"
    t.text "personality"
    t.boolean "sociable"
    t.decimal "weight"
    t.string "status", default: "in_evaluation", null: false
    t.integer "spot"
    t.datetime "entry_date", null: false
    t.datetime "exit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "blocked_at"
    t.string "role", default: "visitor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "adoptions", "pets"
  add_foreign_key "adoptions", "users"
  add_foreign_key "identities", "users"
end
