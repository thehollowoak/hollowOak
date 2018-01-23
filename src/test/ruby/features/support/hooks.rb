require 'watir'

Before do |scenario|
    @browser = Watir::Browser.new :firefox
    visit_page Login
    on_page Login do |page|
        page.username = USER
        page.password = PASS
        page.submit
    end
    create_test_item
end

After do |scenario|
    delete_test_item
    @browser.close
end

















USER = 'ShayFibbernacci'
PASS = '~Cgy753712'