class CreateDeputies < ActiveRecord::Migration[5.2]
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :current_position
      t.string :photo_href
      t.timestamps
    end
  end
end
