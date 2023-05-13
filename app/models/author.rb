class Author < ApplicationRecord
    has_one_attached :profile

    def profile_url
        Rails.application.routes.url_helpers.url_for(profile) if profile.attached?
    end
end
