class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :brewery_type
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :website_url
      t.string :image_url

      t.timestamps
    end
  end
end
