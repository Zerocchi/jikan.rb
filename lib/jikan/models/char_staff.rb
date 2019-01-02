require 'jikan/models/entity'

module Jikan
  class CharacterStaff < BaseEntity
    
    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end

    def image_url
			raw['image_url']
		end

		def role
			raw['role']
		end

		def voice_actors
			raw['voice_actors'].map do |va|
				VoiceActor.new(va)
			end
		end

		class VoiceActor < BaseEntity

			def mal_id
				raw['mal_id']
			end

			def name
				raw['name']
			end

			def url
				raw['url']
			end

			def image_url
				raw['image_url']
			end

			def language
				raw['language']
			end
		end
  end
end