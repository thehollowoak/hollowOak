require 'page-object'
include PageObject::PageFactory

Given(/^there is an item in the database$/) do
    create_test_item
end

When(/^I visit the home page$/) do
    visit_page Home
end

Then(/^I should see that item displayed$/) do
    on_page Home do |page|
        expect(page.test_img_element).to exist
    end
    delete_test_item
end