class CreateRealtors < ActiveRecord::Migration
  def self.up
    create_table :realtors do |t|
      t.string :name, :phone_number, :cell_number, :voicemail_number
      t.string :email, :website, :bio_link, :url_tag
      t.timestamps
    end
  end

  def self.down
    drop_table :realtors
  end
end
