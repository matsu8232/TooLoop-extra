class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum status: { available: 0, maintenance: 1 }
  has_one_attached :image
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    return false if user.nil?
    favorites.where(user_id: user.id).exists?
  end

  validates :name, presence: true, length: { maximum: 15 }
  validates :description, presence: true, length: { maximum: 200}
end
