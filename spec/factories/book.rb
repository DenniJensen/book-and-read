FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "The Title #{n}" }
    sequence(:subtitle) { |n| "The Subtitle #{n}" }
    published_at Date.new
    description 'bla bla bla bla bla'
    language 'en'
    image_link 'www.example.com'
    pages '410'
    sequence(:isbn) { |n| "123456789#{n}" }
    sequence(:isbn_13) { |n| "123456789#{n}" }
  end
end
