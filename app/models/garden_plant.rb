class GardenPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :garden
  belongs_to :fertilizer
end
