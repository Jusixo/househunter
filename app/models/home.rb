class Home < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :price, presence: true

  include ImageUploader[:image]

  belongs_to :created_by, class_name: "User"
  has_many :favorites, dependent: :destroy

  def can_user_edit?(user)
    created_by == user
  end

  def can_user_destroy?(user)
    created_by == user
  end

  #search
  def self.search(search)
    where("address like ? or  city like ? or state like ? or zip = ?", "%#{@search}%", "%#{@search}%", "%#{@search}%", @search.to_i)
  end

  # after_save ThinkingSphinx::RealTime.callback_for(:home)

  def square_meters
    square_feet * 0.0929
  end
end
