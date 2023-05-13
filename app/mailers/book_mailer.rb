class BookMailer < ApplicationMailer
    def book_information_email(book, subscriber)
        @book = book
        @subscriber = subscriber
      
        attachments.inline[@book.book_name] = @book.cover_photo.download if @book.cover_photo.attached?
       

        @book.authors.each do |author|
            attachments.inline[author.profile_name] = author.profile.download if author.profile.attached?
        end


       
        attachments[@book.pdf_name] = {
            mime_type: 'application/pdf',
            content: @book.pdf_file.download
        }

        mail(to: @subscriber.email, subject: "New Book Publication Notice")
    end
end
