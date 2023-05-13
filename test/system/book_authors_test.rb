require "application_system_test_case"

class BookAuthorsTest < ApplicationSystemTestCase
  setup do
    @book_author = book_authors(:one)
  end

  test "visiting the index" do
    visit book_authors_url
    assert_selector "h1", text: "Book authors"
  end

  test "should create book author" do
    visit book_authors_url
    click_on "New book author"

    fill_in "Author", with: @book_author.author_id
    fill_in "Book", with: @book_author.book_id
    click_on "Create Book author"

    assert_text "Book author was successfully created"
    click_on "Back"
  end

  test "should update Book author" do
    visit book_author_url(@book_author)
    click_on "Edit this book author", match: :first

    fill_in "Author", with: @book_author.author_id
    fill_in "Book", with: @book_author.book_id
    click_on "Update Book author"

    assert_text "Book author was successfully updated"
    click_on "Back"
  end

  test "should destroy Book author" do
    visit book_author_url(@book_author)
    click_on "Destroy this book author", match: :first

    assert_text "Book author was successfully destroyed"
  end
end
