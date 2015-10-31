(1..100).each do |index|
  Book.create(title: "Book_#{index}",
              isbn: "123345689#{index}",
              isbn_13: "123455#{index}",
              pages: index)
end

Author.create(name: "Test One")
Author.create(name: "Two Test")
Author.create(name: "Mr Test Three")
