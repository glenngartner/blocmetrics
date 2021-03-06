class RegisteredApplication < ActiveRecord::Base
  before_save {name.downcase!}
  before_save {url.downcase!}
  belongs_to :user
  has_many :events

  validates :user, presence: true
  validates :name, presence: true
  validates :url, presence: true
end
