require "application_system_test_case"

class EscrowsTest < ApplicationSystemTestCase
  setup do
    @escrow = escrows(:one)
  end

  test "visiting the index" do
    visit escrows_url
    assert_selector "h1", text: "Escrows"
  end

  test "should create escrow" do
    visit escrows_url
    click_on "New escrow"

    fill_in "Payment amount", with: @escrow.payment_amount
    fill_in "Payment for", with: @escrow.payment_for
    fill_in "Role", with: @escrow.role
    fill_in "Transaction fees", with: @escrow.transaction_fees
    click_on "Create Escrow"

    assert_text "Escrow was successfully created"
    click_on "Back"
  end

  test "should update Escrow" do
    visit escrow_url(@escrow)
    click_on "Edit this escrow", match: :first

    fill_in "Payment amount", with: @escrow.payment_amount
    fill_in "Payment for", with: @escrow.payment_for
    fill_in "Role", with: @escrow.role
    fill_in "Transaction fees", with: @escrow.transaction_fees
    click_on "Update Escrow"

    assert_text "Escrow was successfully updated"
    click_on "Back"
  end

  test "should destroy Escrow" do
    visit escrow_url(@escrow)
    click_on "Destroy this escrow", match: :first

    assert_text "Escrow was successfully destroyed"
  end
end
