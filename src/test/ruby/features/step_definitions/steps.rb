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
        expect(page.title).to eq 'Test Item'
    end
end


When(/^I click 'add to cart'$/) do
    on_page View do |page|
        page.cart
    end
end

Then(/^the item will be in my cart$/) do
    on_page Nav do |page|
        page.cart
    end
    on_page Cart do |page|
        expect(page.item_element).to exist
    end
end


When(/^I click 'deactivate'$/) do
    on_page Nav do |page|
        page.deactivate
    end
end

Then(/^the item will be in projects instead of home$/) do
    on_page Home do |page|
        on_page Nav do |nav|
            expect(page.test_img_element).not_to exist
            nav.projects
            expect(page.test_img_element).to exist
            page.test_img_element.click
            nav.activate
        end
    end
end


Given(/^I put (\d+) of an item in the cart$/) do |amount|
    on_page Home do |page|
        page.test_img_element.click
    end
    on_page View do |page|
        amount.times do
            page.cart
        end
    end
    visit_page Cart
end

When(/^I click the plus button$/) do
    on_page Cart do |page|
        page.plus
    end
end

When(/^I click the minus button$/) do
    on_page Cart do |page|
        page.minus
    end
end

Then(/^there ((is)|(are)) (\d+) of the item in the cart$/) do |ignore, amount|
    on_page Cart do |page|
        expect(page.amount).to eq "#{amount}"
    end
end

Then(/^the item is no longer in the cart$/) do
    on_page Cart do |page|
        expect(page.item_element).not_to exist
    end
end