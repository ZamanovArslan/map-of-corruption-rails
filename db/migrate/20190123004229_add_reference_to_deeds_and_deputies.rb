class AddReferenceToDeedsAndDeputies < ActiveRecord::Migration[5.2]
  def change
    add_reference :deeds, :admin, index: true
    add_reference :deputies, :admin, index: true
  end
end
