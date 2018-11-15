class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :region_code
      t.string :region_value
      t.timestamps
    end
  end
end
