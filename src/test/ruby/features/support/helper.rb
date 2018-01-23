def create_test_item
    visit_page NewItem
    on_page NewItem do |page|
        page.name = 'Test Item'
        page.imgs = 'grails.svg'
        page.price = '10'
        page.description = 'Test description'
        page.check_forSale
        page.submit
    end
end

def delete_test_item
    visit_page Home
    on_page Home do |page|
        page.test_img_element.click
        page.delete
    end
end