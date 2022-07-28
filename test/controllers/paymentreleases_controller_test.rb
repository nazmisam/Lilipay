require "test_helper"

class PaymentreleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paymentrelease = paymentreleases(:one)
  end

  test "should get index" do
    get paymentreleases_url
    assert_response :success
  end

  test "should get new" do
    get new_paymentrelease_url
    assert_response :success
  end

  test "should create paymentrelease" do
    assert_difference("Paymentrelease.count") do
      post paymentreleases_url, params: { paymentrelease: { address: @paymentrelease.address, amount: @paymentrelease.amount, city: @paymentrelease.city, contact_number: @paymentrelease.contact_number, country: @paymentrelease.country, description: @paymentrelease.description, escrow_id: @paymentrelease.escrow_id, name: @paymentrelease.name, postal_code: @paymentrelease.postal_code, state: @paymentrelease.state, transaction_number: @paymentrelease.transaction_number } }
    end

    assert_redirected_to paymentrelease_url(Paymentrelease.last)
  end

  test "should show paymentrelease" do
    get paymentrelease_url(@paymentrelease)
    assert_response :success
  end

  test "should get edit" do
    get edit_paymentrelease_url(@paymentrelease)
    assert_response :success
  end

  test "should update paymentrelease" do
    patch paymentrelease_url(@paymentrelease), params: { paymentrelease: { address: @paymentrelease.address, amount: @paymentrelease.amount, city: @paymentrelease.city, contact_number: @paymentrelease.contact_number, country: @paymentrelease.country, description: @paymentrelease.description, escrow_id: @paymentrelease.escrow_id, name: @paymentrelease.name, postal_code: @paymentrelease.postal_code, state: @paymentrelease.state, transaction_number: @paymentrelease.transaction_number } }
    assert_redirected_to paymentrelease_url(@paymentrelease)
  end

  test "should destroy paymentrelease" do
    assert_difference("Paymentrelease.count", -1) do
      delete paymentrelease_url(@paymentrelease)
    end

    assert_redirected_to paymentreleases_url
  end
end
