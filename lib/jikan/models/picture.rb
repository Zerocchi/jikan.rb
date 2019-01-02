require 'jikan/models/entity'

module Jikan
  class Picture < BaseEntity
    
    def large
      raw['large']
    end

    def small
      raw['small']
    end
  end
end