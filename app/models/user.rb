class User < ApplicationRecord
  has_many :news

  def to_label
    login
  end
end
