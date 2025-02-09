require 'rails_helper'

RSpec.describe "As a user", type: :feature do
  describe "when I visit the books index page" do
    it "I see the info for each book" do
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
      math.authors << [author_3, author_4]
      history.authors << author_5
      art.authors << [author_1, author_2, author_4, author_6]

      visit '/books'

      within "#book-#{science.id}" do
        expect(page).to have_content("#{science.title}")
        expect(page).to have_content("#{science.pages}")
        expect(page).to have_content("#{science.publication_year}")
        expect(page).to have_link("#{author_1.name}")
        expect(page).to have_link("#{author_2.name}")
        expect(page).to have_link("#{author_3.name}")
      end

      within "#book-#{math.id}" do
        expect(page).to have_content("#{math.title}")
        expect(page).to have_content("#{math.pages}")
        expect(page).to have_content("#{math.publication_year}")
        expect(page).to have_link("#{author_3.name}")
        expect(page).to have_link("#{author_4.name}")
      end

      within "#book-#{history.id}" do
        expect(page).to have_content("#{history.title}")
        expect(page).to have_content("#{history.pages}")
        expect(page).to have_content("#{history.publication_year}")
        expect(page).to have_link("#{author_5.name}")
      end

      within "#book-#{art.id}" do
        expect(page).to have_content("#{art.title}")
        expect(page).to have_content("#{art.pages}")
        expect(page).to have_content("#{art.publication_year}")
        expect(page).to have_link("#{author_1.name}")
        expect(page).to have_link("#{author_2.name}")
        expect(page).to have_link("#{author_4.name}")
        expect(page).to have_link("#{author_6.name}")
      end
    end
  end
end
