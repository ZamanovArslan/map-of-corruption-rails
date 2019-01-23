class AddViewsToDeputy < ActiveRecord::Migration[5.2]
  def change
    add_column :deputies, :views, :integer, :default => 0
  end
end
