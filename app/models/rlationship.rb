class Rlationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'Language'
end
