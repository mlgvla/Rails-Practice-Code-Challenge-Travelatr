class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
        post = self.posts.max_by {|post| post.likes}
    end

    def most_written_about_destinations
        destinations = self.destinations.max_by(5) { |destination| destination.posts.length }
    end
end
