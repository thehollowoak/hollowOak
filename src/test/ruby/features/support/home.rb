require 'page-object'

class Home
  include PageObject

  page_url "http://localhost:8080"

  image(:test_img, :alt => 'Test Item')
  link(:delete, :text => 'Delete')
  link(:cart, :text => 'Cart')
end

class View
    include PageObject

    h1(:title, :text => 'Test Item')
    link(:cart, :class => 'btn-primary')
end

class Cart
    include PageObject

    link(:item, :text => 'Test Item')
end