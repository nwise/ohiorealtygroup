class AddPositionToReators < ActiveRecord::Migration
  def self.up
    add_column :realtors, :position, :integer
  end

  def self.down
    remove_column :realtors, :position
  end
end
