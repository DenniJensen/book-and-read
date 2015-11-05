file = File.read(Rails.root.join 'books.json')
json = JSON.parse(file).flatten

json.each do |book|
  Book.create(title: book['title'],
              subtitle: book['subtitle'],
              isbn: book['isbn10'],
              isbn_13: book['isbn13'],
              isbn_13: book['isbn13'],
              pages: book['pageCount'],
              description: book['description'],
              image_link: book['thumbnail'],
              language: book['language']
             )
end

Author.create(name: "Test One")
Author.create(name: "Two Test")
Author.create(name: "Mr Test Three")
