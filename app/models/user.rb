class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :content, length: { maximum: 255 }
        
  
  has_secure_password     
  has_many :items
  has_many :relationships
  has_many :likes, through: :relationships,source: :item
  
  def like(other_item)
    self.relationships.find_or_create_by(item_id: other_item.id)
  end
  
  def unlike(other_item)
    relationship = self.relationships.find_by(item_id: other_item.id)
    relationship.destroy if relationship
  end
  
  def liking?(other_item)
    self.likes.include?(other_item)
  end
  
    def self.search(search)
      if search 
          Item.where(['content LIKE ?', "#{search}"])
      else
        Item.all
        flash[:danger] = '#{search}の検索結果はありませんでした'
      end
    end
end
