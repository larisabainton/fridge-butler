class Fridge < ActiveRecord::Base
  belongs_to :user
  has_many :fridgecategories
  has_many :groceries, through: :fridgecategories

  validates :name, presence: true
  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
