require "application_system_test_case"

class PaymentreleasesTest < ApplicationSystemTestCase
  setup do
    @paymentrelease = paymentreleases(:one)
  end

  test "visiting the index" do
    visit paymentreleases_url
    assert_selector "h1", text: "Paymentreleases"
  end

  test "should create paymentrelease" do
    visit paymentreleases_url
    click_on "New paymentrelease"

    fill_in "Address", with: @paymentrelease.address
    fill_in "Amount", with: @paymentrelease.amount
    fill_in "City", with: @paymentrelease.city
    fill_in "Contact number", with: @paymentrelease.contact_number
    fill_in "Country", with: @paymentrelease.country
    fill_in "Description", with: @paymentrelease.description
    fill_in "Escrow", with: @paymentrelease.escrow_id
    fill_in "Name", with: @paymentrelease.name
    fill_in "Postal code", with: @paymentrelease.postal_code
    fill_in "State", with: @paymentrelease.state
    fill_in "Transaction number", with: @paymentrelease.transaction_number
    click_on "Create Paymentrelease"

    assert_text "Paymentrelease was successfully created"
    click_on "Back"
  end

  test "should update Paymentrelease" do
    visit paymentrelease_url(@paymentrelease)
    click_on "Edit this paymentrelease", match: :first

    fill_in "Address", with: @paymentrelease.address
    fill_in "Amount", with: @paymentrelease.amount
    fill_in "City", with: @paymentrelease.city
    fill_in "Contact number", with: @paymentrelease.contact_number
    fill_in "Country", with: @paymentrelease.country
    fill_in "Description", with: @paymentrelease.description
    fill_in "Escrow", with: @paymentrelease.escrow_id
    fill_in "Name", with: @paymentrelease.name
    fill_in "Postal code", with: @paymentrelease.postal_code
    fill_in "State", with: @paymentrelease.state
    fill_in "Transaction number", with: @paymentrelease.transaction_number
    click_on "Update Paymentrelease"

    assert_text "Paymentrelease was successfully updated"
    click_on "Back"
  end

  test "should destroy Paymentrelease" do
    visit paymentrelease_url(@paymentrelease)
    click_on "Destroy this paymentrelease", match: :first

    assert_text "Paymentrelease was successfully destroyed"
  end
end
