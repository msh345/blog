class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
  has_many :tags, :through => :post_tags
  has_many :post_tags
  belongs_to :user

  def tags=(tag_names)
  	self.tags.clear
  	tag_names.split(',').each do |name|
  		self.tags << Tag.find_or_create_by_name(name.strip)
  	end
  	return self.tags
  end

end