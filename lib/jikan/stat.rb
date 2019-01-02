require 'jikan/entity'

module Jikan
  class Stat < BaseEntity

    def watching
      raw['watching']
    end

    def completed
      raw['completed']
    end

    def on_hold
      raw['on_hold']
    end

    def dropped
      raw['dropped']
    end

    def ptw
      raw['plan_to_watch']
    end

    def total
      raw['total']
    end

    def scores
      raw['scores']
    end

  end
end