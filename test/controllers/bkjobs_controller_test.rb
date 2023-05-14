require "test_helper"

class BkjobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bkjob = bkjobs(:one)
  end

  test "should get index" do
    get bkjobs_url
    assert_response :success
  end

  test "should get new" do
    get new_bkjob_url
    assert_response :success
  end

  test "should create bkjob" do
    assert_difference("Bkjob.count") do
      post bkjobs_url, params: { bkjob: {  } }
    end

    assert_redirected_to bkjob_url(Bkjob.last)
  end

  test "should show bkjob" do
    get bkjob_url(@bkjob)
    assert_response :success
  end

  test "should get edit" do
    get edit_bkjob_url(@bkjob)
    assert_response :success
  end

  test "should update bkjob" do
    patch bkjob_url(@bkjob), params: { bkjob: {  } }
    assert_redirected_to bkjob_url(@bkjob)
  end

  test "should destroy bkjob" do
    assert_difference("Bkjob.count", -1) do
      delete bkjob_url(@bkjob)
    end

    assert_redirected_to bkjobs_url
  end
end
