require 'page-object'

class Home
    include PageObject

    page_url "http://localhost:8080"

    image(:test_img, :alt => 'Test Item')
end

class Nav
    include PageObject

    link(:projects, :text => 'Projects')
    link(:cart, :text => 'Cart')
    link(:deactivate, :text => 'Deactivate')
    link(:activate, :text => 'Activate')
    link(:delete, :text => 'Delete')
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

