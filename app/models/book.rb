class Book < ApplicationRecord
    has_rich_text :description
    has_one_attached :cover_photo
    has_one_attached :pdf_file
    has_many :book_authors, dependent: :destroy
    has_many :book_categories, dependent: :destroy
    has_many :authors, through: :book_authors
    has_many :categories, through: :book_categories


    def cover_photo_url
        Rails.application.routes.url_helpers.url_for(cover_photo) if cover_photo.attached?
    end
    
    def pdf_file_url
        Rails.application.routes.url_helpers.url_for(pdf_file) if pdf_file.attached?
    end

    def get_authors
        str = ''
        self.authors.each do |author|
            str = str + ' | ' + author.name
        end 
        return str
    end

    def get_categories
        str = ''
        self.categories.each do |category|
            str = str + ' | ' + category.name
        end 
        return str
    end

    def publish_book
       
        now = Time.now.utc.to_date 
        self.published_date = now 
        self.save
        Subscriber.all.each do |subscriber|
            SentMailJob.perform_later(self.id,subscriber.id)
        end
       
    end
end
