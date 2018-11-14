class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions, {:id => false} do |t|
      t.string :region_code
      t.string :region_value
      t.timestamps
    end
    execute "ALTER TABLE regions ADD PRIMARY KEY (region_code);"
  end
end
