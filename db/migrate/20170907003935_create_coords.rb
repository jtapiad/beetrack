class CreateCoords < ActiveRecord::Migration[5.0]
  def change
    create_table :coords do |t|
      t.string :latitude
      t.string :longitude
      t.string :vehicle_identifier

      t.timestamps
    end
  end
end
