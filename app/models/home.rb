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

  def self.search(search)
    where("address LIKE ? or city LIKE ? or state LIKE ? or zip LIKE ?",
    "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  after_save ThinkingSphinx::RealTime.callback_for(:home)

end
