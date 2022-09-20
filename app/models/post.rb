class Post < ApplicationRecord
    validates :title, presence: true
    validate :genres?


    GENRE_PATTERNS = [
        /Fiction/i,
        /Non-Fiction/i
    ]

    def genres?
        if GENRE_PATTERNS.none? { |genre| genre.match category}
            errors.add(:genre, 'must be Fiction or Non Fiction')
        end
    end
end
