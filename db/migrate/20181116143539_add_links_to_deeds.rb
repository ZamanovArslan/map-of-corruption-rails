class AddLinksToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :links, :string, array: true
  end
end
