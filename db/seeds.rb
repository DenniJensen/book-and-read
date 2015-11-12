file = File.read(Rails.root.join 'books.json')
json = JSON.parse(file).flatten

Author.create(name: "Martin Fowler")
Author.create(name: "Russ Olsen")
Author.create(name: "Rober C. Martin")

json.each do |book|
  b = Book.create(title: book['title'],
              subtitle: book['subtitle'],
              isbn: book['isbn10'],
              isbn_13: book['isbn13'],
              isbn_13: book['isbn13'],
              pages: book['pageCount'],
              description: book['description'],
              image_link: book['thumbnail'],
              language: book['language'],
             )
  b.authors << Author.first
  b.save
end

['Dennis', 'Paul', 'Martin'].each do |name|
  User.create email:  "#{name}@test.com",
              password: 'secredfdaff',
              first_name: name,
              last_name: 'Lastname'
end

User.first(2).each do |user|
  user.books << Book.all
  user.save
end

(1..100).each do |number|
  User.create email:  "Dummy_user#{number}@test.com",
              password: 'secredfdaff',
              first_name: "Dummy_#{number}",
              last_name: 'Dummkopf'
end

