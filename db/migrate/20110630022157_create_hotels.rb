class CreateHotels < ActiveRecord::Migration
  def self.up
    create_table :hotels do |t|
      t.string  :name
      t.string  :permalink
      
      t.string    :water_sports
      t.integer :num_rooms
      t.string    :concierge_floor
      t.string  :city
      t.string  :address
      t.string    :off_site
      t.string    :biking
      t.string  :zip_code
      t.text    :theme
      t.string    :shuttle_to_parks
      t.string  :cost_range
      t.string    :wired_internet
      t.string    :fitness_center
      t.string    :wireless_internet
      t.string  :url
      t.string  :overall_rating
      t.string  :cost_estimate
      t.string    :tennis
      t.integer :room_rating
      t.string  :category_code
      t.string    :beach
      t.string  :phone_number
      t.string    :suites
      t.string  :state_code
      t.string    :room_service
      t.string    :marina
      t.string  :lodging_area_code
      t.text    :check_rates
      
      t.timestamps
    end
  end

  def self.down
    drop_table :hotels
  end
end
