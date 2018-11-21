class DestroyImageColumnInDeputies < ActiveRecord::Migration[5.2]
  def change
    remove_column :deputies, :photo
  end
end
