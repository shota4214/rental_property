class Property < ApplicationRecord
  validates :name, :rent, :address, :age, presence: true
  has_many :stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :stations, reject_if: proc {|attributes| attributes['route_name'].blank? and attributes['station_name'].blank? and attributes['minutes_on_foot'].blank? }, allow_destroy: true
end
