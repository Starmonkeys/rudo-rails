class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title

  scope :unfinished, where(:done_date => nil)
  scope :alphabetical, order(:title)
end
