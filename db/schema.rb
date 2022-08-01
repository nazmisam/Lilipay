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

ActiveRecord::Schema[7.0].define(version: 2022_08_01_033036) do
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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "escrows", force: :cascade do |t|
    t.integer "roles", default: 0
    t.string "payment_for"
    t.decimal "payment_amount"
    t.decimal "transaction_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
    t.string "vendor_email"
    t.integer "status", default: 0
    t.string "description"
    t.string "shipping_attention"
    t.string "shipping_address"
    t.string "shipping_postal"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_country"
    t.integer "vendor_roles", default: 0
    t.string "tracking_number"
    t.string "buyer_name"
    t.string "buyer_email"
    t.string "contact_number"
    t.decimal "total_pay"
    t.integer "transaction_number"
    t.string "refund_description"
    t.string "refund_reason"
    t.integer "user_id"
  end

  create_table "paymentreleases", force: :cascade do |t|
    t.string "name"
    t.string "contact_number"
    t.decimal "amount"
    t.string "description"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "transaction_number"
    t.bigint "escrow_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "status", default: 0
    t.index ["escrow_id"], name: "index_paymentreleases_on_escrow_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "contact_number"
    t.decimal "amount"
    t.string "description"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "transaction_number"
    t.bigint "escrow_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escrow_id"], name: "index_payments_on_escrow_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "paymentreleases", "escrows"
  add_foreign_key "payments", "escrows"
end
