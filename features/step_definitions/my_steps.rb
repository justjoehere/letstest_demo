And(/^I begin the checkout process as a guest$/) do
  @browser.link(text: 'shopping cart').click
  @browser.checkbox(id: 'termsofservice').set
  @browser.button(id: 'checkout').click
  @browser.button(value: 'Checkout as Guest').click
end

When(/^I enter default billing information$/) do
  @browser.text_field(id: 'BillingNewAddress_FirstName').set "Joe"
  @browser.text_field(id: 'BillingNewAddress_LastName').set "Ours"
  @browser.text_field(id: 'BillingNewAddress_Email').set "kma@hotmail.com"
  @browser.select_list(id: 'BillingNewAddress_CountryId').select "United States"
  @browser.select_list(id: 'BillingNewAddress_StateProvinceId').select "Ohio"
  @browser.text_field(id: 'BillingNewAddress_City').set "Columbus"
  @browser.text_field(id: 'BillingNewAddress_Address1').set "123 Main St"
  @browser.text_field(id: 'BillingNewAddress_ZipPostalCode').set "43215"
  @browser.text_field(id: 'BillingNewAddress_PhoneNumber').set "6145551212"
  @browser.button(value: 'Continue').click
end

And(/^I select same day shipping$/) do
  @browser.div(id: 'shipping-buttons-container').button(value: 'Continue').click
  @browser.label(text: /Next Day Air/).click
  @browser.div(id: 'shipping-method-buttons-container').button(value: 'Continue').click
end

And(/^I enter payment information$/) do
  @browser.select_list(id: 'CreditCardType').select "Amex"
  @browser.text_field(id: 'CardholderName').set "Joe Ours"
  @browser.text_field(id: 'CardNumber').set "378282246310005"
  @browser.select_list(id: 'ExpireMonth').select "03"
  @browser.select_list(id: 'ExpireYear').select "2017"
  @browser.text_field(id: 'CardCode').set "1234"
  @browser.div(id: 'payment-info-buttons-container').button(value: 'Continue').click
end

And(/^I confirm my order$/) do
  expect(@browser.tr(class: 'order-total').text).to eq("Total: $110.00")
  @browser.button(value: 'Confirm').click
end

Then(/^I will receive a confirmation$/) do
  expect(@browser.div(class: 'section order-completed').text.include? "Your order has been successfully processed!").to be_truthy
end

Given(/^I have searched for (.*)$/) do |product|
  @browser.goto('http://bit.ly/2rhVxM6')
  @browser.text_field(id: 'small-searchterms').set product
  @browser.button(value: 'Search').click
end

And(/^I have added (.*) to my cart$/) do |product_name|
  @browser.link(text: product_name).click
  @browser.button(value: 'Add to cart').click
end


And(/^I select (.*) method$/) do |shipping|
  @browser.div(id: 'shipping-buttons-container').button(value: 'Continue').click
  @browser.label(text: /#{shipping}/).click
  @browser.div(id: 'shipping-method-buttons-container').button(value: 'Continue').click
end

And(/^I pay via (.*) using (.*) with (.*)$/) do |cc_type, account, cvv|
  @browser.select_list(id: 'CreditCardType').select cc_type
  @browser.text_field(id: 'CardholderName').set "Joe Ours"
  @browser.text_field(id: 'CardNumber').set account
  @browser.select_list(id: 'ExpireMonth').select "03"
  @browser.select_list(id: 'ExpireYear').select "2017"
  @browser.text_field(id: 'CardCode').set cvv
  @browser.div(id: 'payment-info-buttons-container').button(value: 'Continue').click
end

And(/^I confirm order (.*)$/) do |total|
  expect(@browser.tr(class: 'order-total').text).to eq("Total: $#{total}")
  @browser.button(value: 'Confirm').click
end

Then(/^I a list of products$/) do
  expect(true).to be_truthy
end