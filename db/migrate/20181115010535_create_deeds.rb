class CreateDeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :deeds do |t|
      t.string :position
      t.string :sign
      t.string :punishment
      t.string :status
      t.integer :detriment
      t.datetime :date
      t.timestamps
    end
    add_reference :deeds, :deputy, foreign_key: true
    add_reference :deeds, :region, foreign_key: true
  end
end
