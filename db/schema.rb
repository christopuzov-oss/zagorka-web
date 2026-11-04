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

ActiveRecord::Schema.define(version: 2023_11_17_132838) do

  create_table "article_translations", force: :cascade do |t|
    t.integer "article_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "summary"
    t.text "content"
    t.index ["article_id"], name: "index_article_translations_on_article_id"
    t.index ["locale"], name: "index_article_translations_on_locale"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "summary"
    t.text "content"
    t.integer "status", default: 0, null: false
    t.string "meta_description"
    t.string "meta_keywords"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured", default: false
    t.datetime "publish_at"
    t.bigint "cover_picture_id"
    t.index ["picture_id"], name: "index_articles_on_picture_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "cv_file_name"
    t.string "cv_content_type"
    t.integer "cv_file_size"
    t.datetime "cv_updated_at"
    t.string "city", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "position"
    t.boolean "show_in_header", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_in_footer", default: false
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "about", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "irregularities", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.boolean "tos", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_offer_translations", force: :cascade do |t|
    t.integer "job_offer_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post"
    t.string "location"
    t.string "job_type"
    t.index ["job_offer_id"], name: "index_job_offer_translations_on_job_offer_id"
    t.index ["locale"], name: "index_job_offer_translations_on_locale"
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "post"
    t.string "slug"
    t.string "location"
    t.string "job_type"
    t.integer "position"
    t.boolean "active", default: false
    t.bigint "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["picture_id"], name: "index_job_offers_on_picture_id"
  end

  create_table "leader_translations", force: :cascade do |t|
    t.integer "leader_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "post"
    t.text "content"
    t.index ["leader_id"], name: "index_leader_translations_on_leader_id"
    t.index ["locale"], name: "index_leader_translations_on_locale"
  end

  create_table "leaders", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "content"
    t.string "post"
    t.integer "position"
    t.text "meta_description"
    t.string "meta_keywords"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1, null: false
    t.index ["picture_id"], name: "index_leaders_on_picture_id"
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "summary"
    t.text "content"
    t.index ["locale"], name: "index_product_translations_on_locale"
    t.index ["product_id"], name: "index_product_translations_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "summary"
    t.text "content"
    t.integer "position"
    t.text "meta_description"
    t.string "meta_keywords"
    t.integer "picture_id"
    t.integer "logo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cover_picture_id"
    t.string "facebook_link"
    t.string "youtube_link"
    t.string "instagram_link"
    t.string "official_site_link"
    t.string "store_link"
    t.index ["logo_id"], name: "index_products_on_logo_id"
    t.index ["picture_id"], name: "index_products_on_picture_id"
  end

  create_table "slide_translations", force: :cascade do |t|
    t.integer "slide_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "headline"
    t.string "summary"
    t.string "label"
    t.index ["locale"], name: "index_slide_translations_on_locale"
    t.index ["slide_id"], name: "index_slide_translations_on_slide_id"
  end

  create_table "sliders", force: :cascade do |t|
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders_slides", force: :cascade do |t|
    t.integer "slide_id"
    t.integer "slider_id"
    t.index ["slide_id"], name: "index_sliders_slides_on_slide_id"
    t.index ["slider_id"], name: "index_sliders_slides_on_slider_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "headline"
    t.string "summary"
    t.string "url"
    t.string "label"
    t.integer "bullet", default: 0
    t.boolean "right_align", default: false
    t.bigint "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["picture_id"], name: "index_slides_on_picture_id"
  end

  create_table "static_page_translations", force: :cascade do |t|
    t.integer "static_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "summary"
    t.text "content"
    t.index ["locale"], name: "index_static_page_translations_on_locale"
    t.index ["static_page_id"], name: "index_static_page_translations_on_static_page_id"
  end

  create_table "static_pages", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.integer "position"
    t.text "meta_description"
    t.string "meta_keywords"
    t.integer "picture_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "summary"
    t.string "label"
    t.bigint "mobile_picture_id"
    t.string "banner_url"
    t.index ["category_id"], name: "index_static_pages_on_category_id"
    t.index ["picture_id"], name: "index_static_pages_on_picture_id"
  end

end
