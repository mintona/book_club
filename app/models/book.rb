class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates_presence_of :title, :pages, :publication_year
end
