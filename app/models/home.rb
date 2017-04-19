class Home < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :price, presence: true

  belongs_to :created_by, class_name: "User"
  include ImageUploader[:image]

  def can_user_edit?(user)
    created_by == user
  end

  def can_user_destroy?(user)
    created_by == user
  end
end
