class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :must_be_clickbait

    def must_be_clickbait
        valid_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        valid_titles.each do |s| 
            if title && title.include?(s)
                return :title
            end
        end
        return errors.add(:title, "Not valid title.")
    end
end
