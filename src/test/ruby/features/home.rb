require 'page-object'

class Home
  include PageObject

  page_url "http://localhost:8080"

  image(:test_img, :alt => 'Test Item')
  link(:delete, :text => 'Delete')
#   text_field(:name, :id => 'entry_1000000')
#   button(:submit, :name => 'submit')
end

class View
    include PageObject

    h1(:title, :text => 'Test Item')
end
