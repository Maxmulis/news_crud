class User < ApplicationRecord
  has_many :news, foreign_key: "author_id"

  def to_label
    login
  end
end
