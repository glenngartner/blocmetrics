class Event < ActiveRecord::Base
  belongs_to :RegisteredApplication

  validates :name, presence: true
  validates :registered_application_id, presence: true
end
