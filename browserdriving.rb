require 'watir'
require 'rspec/expectations'
include RSpec::Matchers

# launch and navigate
@browser = Watir::Browser.new :chrome
@browser.goto('http://centricconsulting.azurewebsites.net')

# Search for a product
@browser.text_field(id: 'small-searchterms').set 'HTC'
@browser.button(value: 'Search').click

# pull up product detail page
@browser.link(text: 'HTC One Mini Blue').click
@browser.button(value: 'Add to cart').click

# go to cart
@browser.link(text: 'shopping cart').click
@browser.checkbox(id: 'termsofservice').set
@browser.button(id: 'checkout').click
@browser.button(value: 'Checkout as Guest').click

# checkout info
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

# Shipping Information - Only Continue
@browser.div(id: 'shipping-buttons-container').button(value: 'Continue').click
@browser.label(text: /Next Day Air/).click
@browser.div(id: 'shipping-method-buttons-container').button(value: 'Continue').click

# CC information
# Visa 4111111111111111 any expiration
# Mastercard 5105105105105100 any expiration
@browser.select_list(id: 'CreditCardType').select "Amex"
@browser.text_field(id: 'CardholderName').set "Joe Ours"
@browser.text_field(id: 'CardNumber').set "378282246310005"
@browser.select_list(id: 'ExpireMonth').select "03"
@browser.select_list(id: 'ExpireYear').select "2017"
@browser.text_field(id: 'CardCode').set "1234"
@browser.div(id: 'payment-info-buttons-container').button(value: 'Continue').click

#verify and confirm
expect(@browser.tr(class: 'order-total').text).to eq("Total: $110.00")
@browser.button(value: 'Confirm').click
expect(@browser.div(class: 'section order-completed').text.include? "Your order has been successfully processed!").to be_truthy
@browser.screenshot.save 'test.jpg'
@browser.close