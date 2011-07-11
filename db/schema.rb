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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110630022157) do

  create_table "attractions", :force => true do |t|
    t.string  "name"
    t.string  "permalink"
    t.integer "park_id"
    t.string  "when_to_go"
    t.string  "scheduled_code"
    t.string  "reflective_captioning"
    t.string  "physical_considerations"
    t.string  "open_not_so_scary"
    t.string  "open_emh_evening"
    t.string  "duration"
    t.string  "average_wait_assumes"
    t.string  "scope_and_scale_code"
    t.string  "intense"
    t.string  "created_at"
    t.string  "video_captioning"
    t.string  "open_very_merry"
    t.string  "not_to_be_missed"
    t.string  "assistive_listening"
    t.string  "wheelchair_transfer_code"
    t.string  "updated_at"
    t.string  "special_needs"
    t.string  "single_rider"
    t.string  "seasonal"
    t.string  "handheld_captioning"
    t.string  "frightening"
    t.string  "no_service_animals"
    t.string  "loading_speed"
    t.string  "fastpass_booth"
    t.string  "what_it_is"
    t.string  "ultimate_code"
    t.string  "open_emh_morning"
    t.string  "category_code"
    t.string  "sign_language"
    t.string  "service_animal_check"
    t.string  "rider_swap"
    t.string  "average_wait_per_hundred"
    t.string  "short_name"
    t.string  "probable_wait_time"
    t.string  "ultimate_task"
    t.string  "time_zone"
    t.string  "audio_description"
    t.string  "height_restriction"
    t.string  "extinct_on"
    t.string  "opened_on"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body"
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "dinings", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "when_to_go"
    t.string   "child_lunch_menu_url"
    t.string   "adult_dinner_menu_url"
    t.string   "wine_list"
    t.string   "disney_permalink"
    t.string   "dinner_hours"
    t.string   "code"
    t.string   "child_breakfast_menu_url"
    t.string   "breakfast_hours"
    t.string   "adult_breakfast_menu_url"
    t.string   "requires_pre_payment"
    t.string   "dress"
    t.string   "overall_rating"
    t.string   "counter_quality_rating"
    t.string   "awards"
    t.string   "requires_credit_card"
    t.string   "portion_size"
    t.string   "category_code"
    t.string   "phone_number"
    t.string   "parking"
    t.string   "lunch_hours"
    t.string   "counter_value_rating"
    t.string   "child_dinner_menu_url"
    t.string   "cuisine"
    t.string   "bar"
    t.integer  "thumbs_up"
    t.string   "table_quality_rating"
    t.string   "service_rating"
    t.text     "house_specialties"
    t.string   "entree_range"
    t.string   "cost_code"
    t.string   "adult_lunch_menu_url"
    t.string   "table_value_rating"
    t.string   "opened_on"
    t.string   "friendliness_rating"
    t.integer  "dineable_id"
    t.string   "dineable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "water_sports"
    t.integer  "num_rooms"
    t.string   "concierge_floor"
    t.string   "city"
    t.string   "address"
    t.string   "off_site"
    t.string   "biking"
    t.string   "zip_code"
    t.text     "theme"
    t.string   "shuttle_to_parks"
    t.string   "cost_range"
    t.string   "wired_internet"
    t.string   "fitness_center"
    t.string   "wireless_internet"
    t.string   "url"
    t.string   "overall_rating"
    t.string   "cost_estimate"
    t.string   "tennis"
    t.integer  "room_rating"
    t.string   "category_code"
    t.string   "beach"
    t.string   "phone_number"
    t.string   "suites"
    t.string   "state_code"
    t.string   "room_service"
    t.string   "marina"
    t.string   "lodging_area_code"
    t.text     "check_rates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", :force => true do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "submitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "up_votes",     :default => 0, :null => false
    t.integer  "down_votes",   :default => 0, :null => false
  end

  create_table "parks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "up_votes",                            :default => 0,  :null => false
    t.integer  "down_votes",                          :default => 0,  :null => false
    t.string   "photo"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

  create_table "votings", :force => true do |t|
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "up_vote",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votings", ["voteable_type", "voteable_id", "voter_type", "voter_id"], :name => "unique_voters", :unique => true
  add_index "votings", ["voteable_type", "voteable_id"], :name => "index_votings_on_voteable_type_and_voteable_id"
  add_index "votings", ["voter_type", "voter_id"], :name => "index_votings_on_voter_type_and_voter_id"

end
