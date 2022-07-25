require "test_helper"

class EscrowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escrow = escrows(:one)
  end

  test "should get index" do
    get escrows_url
    assert_response :success
  end

  test "should get new" do
    get new_escrow_url
    assert_response :success
  end

  test "should create escrow" do
    assert_difference("Escrow.count") do
      post escrows_url, params: { escrow: { payment_amount: @escrow.payment_amount, payment_for: @escrow.payment_for, role: @escrow.role, transaction_fees: @escrow.transaction_fees } }
    end

    assert_redirected_to escrow_url(Escrow.last)
  end

  test "should show escrow" do
    get escrow_url(@escrow)
    assert_response :success
  end

  test "should get edit" do
    get edit_escrow_url(@escrow)
    assert_response :success
  end

  test "should update escrow" do
    patch escrow_url(@escrow), params: { escrow: { payment_amount: @escrow.payment_amount, payment_for: @escrow.payment_for, role: @escrow.role, transaction_fees: @escrow.transaction_fees } }
    assert_redirected_to escrow_url(@escrow)
  end

  test "should destroy escrow" do
    assert_difference("Escrow.count", -1) do
      delete escrow_url(@escrow)
    end

    assert_redirected_to escrows_url
  end
end
