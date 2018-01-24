include PageObject::PageFactory

Given(/^there is an item in the database$/) do
    # make item in hooks
end

When(/^I'm on the home page$/) do
    visit_page Home
end

Then(/^I should see that item displayed$/) do
    on_page Home do |page|
        expect(page.test_img_element).to exist
    end
end


When(/^I click an item picture$|^I'm on an item page$/) do
    on_page Home do |page|
        page.test_img_element.click
    end
end

Then(/^I should see that item's view page$/) do
    on_page View do |page|
        expect(page.title).to eq('Test Item')
    end
end


When(/^I click 'add to cart'$/) do
    on_page View do |page|
        page.cart
    end
end

Then(/^the item will be in my cart$/) do
    on_page Home do |page|
        page.cart
    end
    on_page Cart do |page|
        expect(page.item_element).to exist
    end
end
