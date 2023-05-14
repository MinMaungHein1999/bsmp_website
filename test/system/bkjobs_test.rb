require "application_system_test_case"

class BkjobsTest < ApplicationSystemTestCase
  setup do
    @bkjob = bkjobs(:one)
  end

  test "visiting the index" do
    visit bkjobs_url
    assert_selector "h1", text: "Bkjobs"
  end

  test "should create bkjob" do
    visit bkjobs_url
    click_on "New bkjob"

    click_on "Create Bkjob"

    assert_text "Bkjob was successfully created"
    click_on "Back"
  end

  test "should update Bkjob" do
    visit bkjob_url(@bkjob)
    click_on "Edit this bkjob", match: :first

    click_on "Update Bkjob"

    assert_text "Bkjob was successfully updated"
    click_on "Back"
  end

  test "should destroy Bkjob" do
    visit bkjob_url(@bkjob)
    click_on "Destroy this bkjob", match: :first

    assert_text "Bkjob was successfully destroyed"
  end
end
