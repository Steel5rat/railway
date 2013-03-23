class Stations_lines < ActiveRecord::Base
  has_and_belongs_to_many = :stations
  validates :station_id, :line_id, :presence => true
end