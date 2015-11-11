FactoryGirl.define do
  factory :book do
    title 'The Title'
    subtitle 'The Subtitle'
    published_at Date.new
    description 'bla bla bla bla bla'
    language 'en'
    image_link 'www.example.com'
    pages '410'
    isbn '1234567890'
    isbn_13 '123456789012'
  end
end
