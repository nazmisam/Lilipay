require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference("Payment.count") do
      post payments_url, params: { payment: { address: @payment.address, amount: @payment.amount, city: @payment.city, contact_number: @payment.contact_number, country: @payment.country, description: @payment.description, escrow_id: @payment.escrow_id, name: @payment.name, postal_code: @payment.postal_code, state: @payment.state, transaction_number: @payment.transaction_number } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { address: @payment.address, amount: @payment.amount, city: @payment.city, contact_number: @payment.contact_number, country: @payment.country, description: @payment.description, escrow_id: @payment.escrow_id, name: @payment.name, postal_code: @payment.postal_code, state: @payment.state, transaction_number: @payment.transaction_number } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference("Payment.count", -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end
