class CreateAdminRealtors < ActiveRecord::Migration
  def self.up
    create_table :admin_realtors do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_realtors
  end
end
