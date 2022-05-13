class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.last(5)
    end

    def average_age_of_bloggers
        self.bloggers.average(:age).to_i
    end

    def featured_post
        post = self.posts.max_by { |post| post.likes }
    end
end
