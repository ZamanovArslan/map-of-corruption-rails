class ChangeDeputies < ActiveRecord::Migration[5.2]
  def change
    add_column :deputies, :surname, :string
    add_column :deputies, :patronymic, :string
    add_column :deputies, :current_position, :string
    add_column :deputies, :photo_href, :string
  end
end
