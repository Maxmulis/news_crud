class News < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :project, foreign_key: "project_id"
  validates :author, :project, :title, :description, presence: true
  validates :title, uniqueness: { scope: [ :author, :project ], message: "news exists already" }
end
