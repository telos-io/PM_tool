class Comment < ActiveRecord::Base

  belongs_to :Task
  belongs_to :Project
  belongs_to :Discussion

  validates :body, presence: {message: "must be provided"}

end
