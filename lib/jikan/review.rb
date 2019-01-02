require 'jikan/entity'

module Jikan
  class Review < BaseEntity

    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end

    def helpful_count
      raw['helpful_count']
    end

    def date
      raw['date']
    end

    def reviewer_url
      raw['reviewer']['url']
    end

    def reviewer_img
      raw['reviewer']['image_url']
    end

    def reviewer_username
      raw['reviewer']['username']
    end

    def reviewer_chapters_read
      raw['reviewer']['chapters_read']
    end

    def reviewer_scores
      raw['reviewer']['scores']
    end

    def content
      raw['content']
    end

  end
end