class CreateDinings < ActiveRecord::Migration
  def self.up
    create_table :dinings do |t|
      t.string  :name
      t.string  :permalink
      
      t.string  :when_to_go 
      t.string  :child_lunch_menu_url
      t.string  :adult_dinner_menu_url 
      t.string  :wine_list 
      t.string  :disney_permalink 
      t.string  :dinner_hours 
      t.string  :code 
      t.string  :child_breakfast_menu_url 
      t.string  :breakfast_hours 
      t.string  :adult_breakfast_menu_url
      t.string    :requires_pre_payment 
      t.string  :dress 
      t.string  :overall_rating 
      t.string  :counter_quality_rating 
      t.string  :awards 
      t.string    :requires_credit_card 
      t.string  :portion_size 
      t.string  :category_code 
      t.string  :phone_number 
      t.string  :parking 
      t.string  :lunch_hours 
      t.string  :counter_value_rating 
      t.string  :child_dinner_menu_url 
      t.string  :cuisine 
      t.string  :bar 
      t.integer :thumbs_up 
      t.string  :table_quality_rating 
      t.string  :service_rating 
      t.text    :house_specialties 
      t.string  :entree_range 
      t.string  :cost_code 
      t.string  :adult_lunch_menu_url 
      t.string  :table_value_rating 
      t.string  :opened_on 
      t.string  :friendliness_rating
      
      t.references :dineable, :polymorphic => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :dinings
  end
end
