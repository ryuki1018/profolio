class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :content, length: { maximum: 255 }
        
  
  has_secure_password     
  has_many :items
      has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
    has_many :followers, through: :reverses_of_relationships, source: :user

  
    
    def follow(other_language)
      self.relationships.find_or_create_by(follow_id: other_language.id)
    end
    
    def unfollow(other_language)
      relationship = self.relationships.find_by(follow_id: other_language.id)
      relationship.destroy if relationship
    end
    
    def following?(other_language)
      self.followings.include?(other_language)
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
