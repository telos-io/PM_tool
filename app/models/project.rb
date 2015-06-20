class Project < ActiveRecord::Base

  #has_many :tasks, dependent: :destroy
  #has_many :comments, dependent: :destroy
  #has_many :discussions, dependent: :destroy

  validates :title, presence: {message: "Must be provided"},
                    uniqueness: true

end
