class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates_presence_of :name

  def average_pages
    books.average(:pages)
  end
end
