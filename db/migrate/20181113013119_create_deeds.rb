class CreateDeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :deeds do |t|
      t.string :position
      t.string :sign
      t.string :punishment
      t.string :status
      t.string :region_code
      t.integer :detriment
      t.datetime :date
      t.timestamps
    end
    add_reference :deeds, :deputy, foreign_key: true
    add_foreign_key :deeds, :regions, column: :region_code, primary_key: "region_code"
  end
end
