require 'page-object'
include PageObject::PageFactory

Given(/^there is an item in the database$/) do
    create_test_item
end

When(/^I'm on the home page$/) do
    visit_page Home
end

Then(/^I should see that item displayed$/) do
    on_page Home do |page|
        expect(page.test_img_element).to exist
    end
    delete_test_item
end

When(/^I click an item picture$/) do
    on_page Home do |page|
        page.test_img_element.click
    end
end

Then(/^I should see that item's view page$/) do
    on_page View do |page|
        expect(page.title).to eq('Test Item')
    end
    delete_test_item
end