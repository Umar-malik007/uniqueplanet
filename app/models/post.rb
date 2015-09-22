class Post < ActiveRecord::Base

  before_save :make_it_permalink
  before_update :make_it_permalink

  def make_it_permalink
    self.permalink = self.title.parameterize
  end

  def to_param
    make_it_permalink
  end

  has_attached_file :image, styles: { medium: "600x600#", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :title


  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order("posts.position ASC")}
  scope :newest_first, lambda { order("posts.created_at DESC")}
  scope :search, lambda {|query|
                 where(["title LIKE ?", "%#{query}%"])
               }


  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
