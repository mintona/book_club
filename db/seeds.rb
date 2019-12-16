# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
