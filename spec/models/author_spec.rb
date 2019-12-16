require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :book_authors}
    it {should have_many(:books).through(:book_authors)}
  end

  describe "methods" do
    describe "#average_pages" do
      it "calculates average number of pages for all their books" do
        author_1 = Author.create!(name: "Alison Minton")

        science = Book.create!(title: "Everything About Science", pages: 455, publication_year: 1985)
        math = Book.create!(title: "A Giant Book About Math", pages: 1001, publication_year: 2015)
        history = Book.create!(title: "World History", pages: 342, publication_year: 1997)
        art = Book.create!(title: "Art: In a Nutshell", pages: 855, publication_year: 2003)

        author_1.books << [science, math, history, art]

        expect(author_1.average_pages).to eq(663.25)
      end
    end
  end
end
