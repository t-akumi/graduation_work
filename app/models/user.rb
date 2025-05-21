class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :stocks, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_arts, through: :likes, source: :article
  validates :password, length: {minimum: 3}, if: -> {new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> {new_record? || changes[:crypted_password] }
  validates :password_confirmation,presence: true, if: -> {new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true

  def own?(object)
    id == object&.user_id
  end
end
