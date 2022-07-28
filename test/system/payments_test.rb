require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  setup do
    @payment = payments(:one)
  end

  test "visiting the index" do
    visit payments_url
    assert_selector "h1", text: "Payments"
  end

  test "should create payment" do
    visit payments_url
    click_on "New payment"

    fill_in "Address", with: @payment.address
    fill_in "Amount", with: @payment.amount
    fill_in "City", with: @payment.city
    fill_in "Contact number", with: @payment.contact_number
    fill_in "Country", with: @payment.country
    fill_in "Description", with: @payment.description
    fill_in "Escrow", with: @payment.escrow_id
    fill_in "Name", with: @payment.name
    fill_in "Postal code", with: @payment.postal_code
    fill_in "State", with: @payment.state
    fill_in "Transaction number", with: @payment.transaction_number
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back"
  end

  test "should update Payment" do
    visit payment_url(@payment)
    click_on "Edit this payment", match: :first

    fill_in "Address", with: @payment.address
    fill_in "Amount", with: @payment.amount
    fill_in "City", with: @payment.city
    fill_in "Contact number", with: @payment.contact_number
    fill_in "Country", with: @payment.country
    fill_in "Description", with: @payment.description
    fill_in "Escrow", with: @payment.escrow_id
    fill_in "Name", with: @payment.name
    fill_in "Postal code", with: @payment.postal_code
    fill_in "State", with: @payment.state
    fill_in "Transaction number", with: @payment.transaction_number
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment" do
    visit payment_url(@payment)
    click_on "Destroy this payment", match: :first

    assert_text "Payment was successfully destroyed"
  end
end
