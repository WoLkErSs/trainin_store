class Book < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: %i[finders slugged]

  has_many :books_authors, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :authors, through: :books_authors

  belongs_to :category
end
