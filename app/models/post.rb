class Post < ApplicationRecord
  belongs_to :user
  validates :user_id,presence:true
  validates :habit,   presence: true,length: { maximum: 140 }
  validates :friend,  presence: true
  #validates :treat,  presence: true
end
