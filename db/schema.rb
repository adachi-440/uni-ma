# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_08_112627) do

  create_table "evaluations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "evaluator_id", null: false, comment: "評価者ID", unsigned: true
    t.integer "evaluated_id", null: false, comment: "被評価者ID", unsigned: true
    t.integer "rank", null: false, comment: "評価", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluator_id", "evaluated_id"], name: "index_evaluations_on_evaluator_id_and_evaluated_id", unique: true
  end

  create_table "favorites", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "ユーザーID", unsigned: true
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
    t.index ["user_id", "item_id"], name: "index_favorites_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "user_idx"
  end

  create_table "histories", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "ユーザーID", unsigned: true
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
    t.index ["user_id", "item_id"], name: "index_histories_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "user_idx"
  end

  create_table "item_categories", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "label", null: false, comment: "カテゴリー名"
    t.integer "sort", null: false, comment: "sort", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_department_categories", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "item_sub_category_id", null: false, comment: "サブカテゴリーID", unsigned: true
    t.string "label", null: false, comment: "詳細学問名"
    t.integer "sort", null: false, comment: "sort", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_sub_category_id"], name: "item_sub_category_idx"
  end

  create_table "item_images", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.string "name", null: false, comment: "ファイル名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
  end

  create_table "item_sold_statuses", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "label", null: false, comment: "購入状態"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_statuses", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "label", null: false, comment: "商品状態"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_sub_categories", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "label", null: false, comment: "商品サブカテゴリー名"
    t.integer "sort", null: false, comment: "sort", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_tags", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
  end

  create_table "items", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "ユーザーID", unsigned: true
    t.string "name", null: false, comment: "商品名"
    t.string "explanation", limit: 3000, comment: "商品説明"
    t.integer "item_category_id", null: false, comment: "カテゴリーID", unsigned: true
    t.integer "item_department_category_id", null: false, comment: "詳細学問ID", unsigned: true
    t.integer "price", null: false, comment: "価格", unsigned: true
    t.string "place", null: false, comment: "取引場所"
    t.integer "item_status_id", null: false, comment: "商品状態ID", unsigned: true
    t.integer "item_sold_status_id", default: 1, null: false, comment: "購入状態ID", unsigned: true
    t.integer "view", default: 0, null: false, comment: "閲覧数", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_category_id"], name: "item_category_idx"
    t.index ["item_department_category_id"], name: "item_department_category_idx"
    t.index ["item_sold_status_id"], name: "item_sold_status_idx"
    t.index ["item_status_id"], name: "item_status_idx"
    t.index ["user_id"], name: "user_idx"
  end

  create_table "lecture_terms", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "term", null: false, comment: "講義時期"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.string "name", null: false, comment: "講義名"
    t.string "teacher", comment: "教授名"
    t.integer "lecture_term_id", comment: "講義時期ID", unsigned: true
    t.string "explanation", limit: 1000, comment: "講義説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
    t.index ["lecture_term_id"], name: "lecture_term_idx"
  end

  create_table "messages", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "item_id", null: false, comment: "商品ID", unsigned: true
    t.integer "user_id", null: false, comment: "ユーザーID", unsigned: true
    t.string "content", null: false, comment: "メッセージ内容"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "item_idx"
    t.index ["user_id"], name: "user_idx"
  end

  create_table "notifications", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.string "content", limit: 3000, null: false, comment: "内容"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ID", force: :cascade do |t|
    t.integer "follow_id", null: false, comment: "フォローID", unsigned: true
    t.integer "follower_id", null: false, comment: "フォロワーID", unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id", "follower_id"], name: "index_relationships_on_follow_id_and_follower_id", unique: true
    t.index ["follow_id"], name: "follow_idx"
    t.index ["follower_id"], name: "follower_idx"
  end

  create_table "users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "ユーザー名"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "encrypted_password", null: false, comment: "パスワード"
    t.string "profile_image", comment: "プロフィール画像"
    t.string "university", comment: "所属大学"
    t.string "department", comment: "所属学部"
    t.string "faculty", comment: "所属学科"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "file", comment: "プロフィール画像"
    t.string "provider"
    t.string "uid"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
