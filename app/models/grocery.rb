class Grocery < ActiveRecord::Base
  belongs_to :fridgecategory
  belongs_to :grocerylist

  validates :name, presence: true
  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :fridgecategory_id, presence: true, numericality: { only_integer: true }
end
