class Task < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories

  attr_accessible :title, :description, :due_date, :priority, :completed, :category_ids

  validates :title, :presence => true
  validates :due_date, :presence => true
  validates :priority, :inclusion => { :in => %w(low medium high) }
end 