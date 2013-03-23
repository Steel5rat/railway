class Station < ActiveRecord::Base
  has_and_belongs_to_many = :lines
  validates :name, :presence => true


  def to_s
    "#{self.id}. #{self.name}"
  end
end