require 'watir'

Before do |scenario|
    @browser = Watir::Browser.new :firefox
    visit_page Login
    on_page Login do |page|
        page.username = USER
        page.password = PASS
        page.submit
    end
end

After do |scenario|
    @browser.close
end

















USER = 'ShayFibbernacci'
PASS = '~Cgy753712'