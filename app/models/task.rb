class Task < ActiveRecord::Base

  #belongs_to :project
  #has_many :comments, dependent: :destroy
  #has_many :discussions, dependent: :destroy

  validates :title, presence: {message: "Must be provided"},
                    uniqueness: true

end
