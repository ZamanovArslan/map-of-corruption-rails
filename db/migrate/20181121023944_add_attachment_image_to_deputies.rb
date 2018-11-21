class AddAttachmentImageToDeputies < ActiveRecord::Migration[5.2]
  def self.up
    change_table :deputies do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :deputies, :image
  end
end
