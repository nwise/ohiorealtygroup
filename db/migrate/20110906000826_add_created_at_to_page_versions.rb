class AddCreatedAtToPageVersions < ActiveRecord::Migration
  def self.up
#    add_column :page_versions, :created_at, :datetime
  end

  def self.down
#    drop_column :page_versions, :created_at
  end
end
