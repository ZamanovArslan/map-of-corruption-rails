class CreateDeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :deeds do |t|
      t.string :code_region
      t.string :position
      t.string :sign
      t.integer :detriment
      t.string :punishment
      t.string :status
      t.datetime :date
      t.references :deputy, foreign_key: true
      t.timestamps
    end
  end
end
