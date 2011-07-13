class CreateAttractions < ActiveRecord::Migration
  def self.up
    create_table :attractions do |t|
			t.string :name
			t.string :permalink
      t.references :park
      
			t.string :when_to_go
			t.string :scheduled_code
			t.string :reflective_captioning
			t.string :physical_considerations
			t.string :open_not_so_scary
			t.string :open_emh_evening
			t.string :name
			t.string :duration
			t.string :average_wait_assumes
			t.string :scope_and_scale_code
			t.string :intense
			t.string :created_at
			t.string :video_captioning
			t.string :open_very_merry
			t.string :not_to_be_missed
			t.string :assistive_listening
			t.string :wheelchair_transfer_code
			t.string :updated_at
			t.string :special_needs
			t.string :single_rider
			t.string :seasonal
			t.string :handheld_captioning
			t.string :frightening
			t.string :no_service_animals
			t.string :loading_speed
			t.string :fastpass_booth
			t.string :what_it_is
			t.string :ultimate_code
			t.string :open_emh_morning
			t.string :category_code
			t.string :sign_language
			t.string :service_animal_check
			t.string :rider_swap
			t.string :average_wait_per_hundred
			t.string :short_name
			t.string :probable_wait_time
			t.string :ultimate_task
			t.string :time_zone
			t.string :audio_description
			t.string :height_restriction
			t.string :extinct_on
			t.string :opened_on

      t.timestamps
    end
  end

  def self.down
    drop_table :attractions
  end
end
