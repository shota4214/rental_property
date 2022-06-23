class Property < ApplicationRecord
  has_many :stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :stations, allow_destroy: true
end
