require 'page-object'

class Login
    include PageObject

    page_url "http://localhost:8080/login"

    text_field(:username, :name => 'username')
    text_field(:password, :name => 'password')
    button(:submit, :type => 'submit')
end

class NewItem
    include PageObject

    page_url "http://localhost:8080/admin/newItem"

    text_field(:name, :name => 'name')
    text_field(:img, :name => 'img')
    text_field(:price, :name => 'price')
    text_area(:description, :name => 'description')
    checkbox(:forSale, :name => 'forSale')
    button(:submit, :type => 'submit')
end