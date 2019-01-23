class AddReferenceToDeedsAndDeputies < ActiveRecord::Migration[5.2]
  def change
    add_reference :deeds, :admin, foreign_key: true
    add_reference :deputies, :admin, foreign_key: true
  end
end
