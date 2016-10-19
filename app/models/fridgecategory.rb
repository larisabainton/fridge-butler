class Fridgecategory < ActiveRecord::Base
  belongs_to :fridge
  has_many :groceries, dependent: :destroy

  validates :name, presence: true
  validates :fridge_id, presence: true
  validates :fridge_id, numericality: { only_integer: true }
end
