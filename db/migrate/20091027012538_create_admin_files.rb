class CreateAdminFiles < ActiveRecord::Migration
  def self.up
    create_table :admin_files do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_files
  end
end
