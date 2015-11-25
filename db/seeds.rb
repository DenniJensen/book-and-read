
Place.create(longitude: 52.4559007,
            latitude: 13.2967186,
            name: "Institude für Informatik - Takustraße 9 - Frei Universität Berlin")

Place.create(longitude: 52.4529027,
            latitude: 13.2854988,
            name: "Eingang Mensa - Frei Universität Berlin")

def seed_dev
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


  5.times do |number|
    User.create email:  "User_#{number}@test.com",
                password: 'secredfdaff',
                first_name: "User_#{number}",
                last_name: "Lastname#{number}"
  end

  User.first(2).each do |user|
    user.books << Book.last(2)
    user.save
  end
end

seed_dev if Rails.env == 'development'
