class Discussion < ActiveRecord::Base

  has_many :comments
  belongs_to :Task
  belongs_to :Project

  validates :title, presence: {message: "must be provided"}

end
