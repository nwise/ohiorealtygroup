class CreatePages < ActiveRecord::Migration
  def self.up

    create_table :pages do |t|      
      t.string  :url_tag, :title, :html_title, :keywords, :description
      t.text    :content
      t.boolean :published
      t.timestamps      
    end
    add_index :pages, :url_tag

    Page.create_versioned_table

  end

  def self.down
    Page.drop_versioned_table
    drop_table :pages    
  end
end
