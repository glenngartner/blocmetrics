class Event < ActiveRecord::Base
  belongs_to :RegisteredApplication

  validates :name
end
