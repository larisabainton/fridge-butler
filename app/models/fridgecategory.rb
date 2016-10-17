class Fridgecategory < ActiveRecord::Base
  belongs_to :fridge

  validates :name, presence: true
  validates :fridge_id, presence: true
  validates :fridge_id, numericality: { only_integer: true }
end
