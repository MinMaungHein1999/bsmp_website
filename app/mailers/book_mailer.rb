class BookMailer < ApplicationMailer
    def book_information_email(book, subscriber)
        @book = book
        @subscriber = subscriber
      
        attachments.inline['cover_photo.jpg'] = @book.cover_photo.download if @book.cover_photo.attached?
        attachments.inline['book_file.pdf'] = @book.pdf_file.download if @book.pdf_file.attached?
       
        attachments['book_file.pdf'] = {
            mime_type: 'application/pdf',
            content: @book.pdf_file.download
        }

        mail(to: @subscriber.email, subject: "New Book Publication Notice")
    end
end
