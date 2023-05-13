class SentMailJob < ApplicationJob
  queue_as :default

  def perform(book_id, subscriber_id)
    book = Book.find(book_id)
    subscriber = Subscriber.find(subscriber_id)
    BookMailer.book_information_email(book, subscriber).deliver_now
  end
end
