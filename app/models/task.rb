class Task < ActiveRecord::Base

  belongs_to :project
  has_many :comments, depedent: :destroy
  has_many :discussions, dependent: :destroy

  validates :title, presence: {message: "Must be provided"},
                    uniqueness: true
                              
end
