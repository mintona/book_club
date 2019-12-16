require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the books index page" do
    describe "and click on an authors name" do
      it "takes me to that authors show page with their info" do
        science = Book.create!(title: "Everything About Science", pages: 455, publication_year: 1985)
        math = Book.create!(title: "A Giant Book About Math", pages: 1001, publication_year: 2015)
        history = Book.create!(title: "World History", pages: 342, publication_year: 1997)
        art = Book.create!(title: "Art: In a Nutshell", pages: 854, publication_year: 2003)

        author_1 = Author.create!(name: "Alison Minton")
        author_2 = Author.create!(name: "Rick Vermeil")
        author_3 = Author.create!(name: "Suzy Johnson")
        author_4 = Author.create!(name: "Mike Smith")
        author_5 = Author.create!(name: "Jack Frost")
        author_6 = Author.create!(name: "John Anderson")

        science.authors << [author_1, author_2, author_3]
        math.authors << [author_1, author_3, author_4]
        history.authors << author_5
        art.authors << [author_1, author_2, author_4, author_6]

        visit "/books"

        within "#book-#{science.id}" do
          click_on "#{author_1.name}"
        end

        expect(current_path).to eq("/authors/#{author_1.id}")

        expect(page).to have_content(author_1.name)
        expect(page).to have_content(science.title)
        expect(page).to have_content(art.title)
        expect(page).to have_content(math.title)
        expect(page).to have_content("Average Number of Pages: #{author_1.average_pages}")

        visit "/books"

        within "#book-#{history.id}" do
          click_on "#{author_5.name}"
        end

        expect(current_path).to eq("/authors/#{author_5.id}")
        expect(page).to have_content(history.title)
        expect(page).to have_content("Average Number of Pages: #{author_5.average_pages}")
      end
    end
  end
end
