class ChangeIncidentToDeed < ActiveRecord::Migration[5.2]
  def change
    rename_table :incidents, :deeds
  end
end
