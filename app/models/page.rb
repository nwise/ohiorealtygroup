class Page < ActiveRecord::Base
  acts_as_versioned :foreign_key => 'page_id'
  has_many :page_versions
  before_save :set_url_tag
  validates_presence_of :title, :content

  scope :published, :conditions => ['published=?', true]

  def set_url_tag   
    self.url_tag = self.title.gsub(/[^a-z0-9]+/i, '-').downcase if self.url_tag.blank?
  end

end
