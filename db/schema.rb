# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_28_142642) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id", unique: true
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  create_table "destinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.string "postal_code", null: false
    t.integer "area_id", null: false
    t.string "city", null: false
    t.string "street_address", null: false
    t.string "building_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_destinations_on_user_id", unique: true
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "photo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.integer "size_id", null: false
    t.integer "status_id", default: 1, null: false
    t.integer "condition_id", null: false
    t.integer "delivery_expense_id", null: false
    t.integer "delivery_method_id", null: false
    t.integer "area_id", null: false
    t.integer "shipdate_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "category_id", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.date "birthdate", null: false
    t.text "profile"
    t.string "image"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "destinations", "users"
  add_foreign_key "photos", "products"
<<<<<<< HEAD
=======
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
>>>>>>> 0b62745606cd55f2219ce26813bc48f14a2b5b79
end
