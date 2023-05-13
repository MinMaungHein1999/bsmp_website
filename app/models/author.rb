class Author < ApplicationRecord
    has_one_attached :profile
    has_many :book_authors, dependent: :destroy
    has_many :books, through: :book_authors

   
    def profile_name 
        file_type = profile.content_type.split('/').last
        name.downcase.gsub(" ", "_") + "." + file_type
    end

    def profile_url
        Rails.application.routes.url_helpers.url_for(profile) if profile.attached?
    end
end
