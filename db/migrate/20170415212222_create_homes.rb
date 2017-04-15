class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :bedroom
      t.integer :bath
      t.integer :square_feet
      t.integer :price
      t.string :description
      t.string :parking
      t.text :img_data
      t.string :roof_type
      t.integer :lot_size
      t.integer :hoa
      t.integer :hoa_fee
      t.integer :number_of_floors
      t.integer :year_built

      t.timestamps
    end
  end
end
