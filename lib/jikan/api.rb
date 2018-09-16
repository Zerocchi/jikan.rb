require "http"
require "json"
require "uri"

module Jikan
  class API

    def initialize(use_ssl=true, use_v3=false)
			@endpoint = ""
			@id = nil
			@flag = nil
			@selected_base = if use_ssl then Jikan::BASE_URL_V3_SSL else Jikan::BASE_URL_v3 end
		end

		def get(endpoint, id, flag=nil, qry='')
			@endpoint = endpoint
			@id = id
			@flag = flag
      @query = qry

			construct_url
			get_data
		end

    private

		def construct_url
			@end_url = "#{@selected_base}/#{@endpoint}"
      @url = "#{@end_url}/#{@id}"

      if @endpoint.eql?('search')
				unless Jikan::FLAGS[@endpoint].include? @flag
					raise Jikan::FlagError, 'Flag not supported'
				else
					# This is inconsistencies in the API.
					if @flag == :anime || @flag == :manga
						# @url = "#{@end_url}/#{@flag.to_s}/#{@query.downcase.delete(' ')}/#{@id}" -- v2
						@url = URI.encode("#{@end_url}/#{@flag.to_s}?q=#{@query}&page=#{@id}") # v3
					elsif @flag == :character || @flag == :person
						#@url = "#{@end_url}/#{@flag.to_s}/#{@query.downcase.gsub!(' ', '_')}/#{@id}" -- v2
						@url = URI.encode("#{@end_url}/#{@flag.to_s}?q=#{@query}&page=#{@id}") # v3
					end
				end
      end

			unless @flag.nil? || @endpoint.eql?('search')
				unless Jikan::FLAGS[@endpoint].include? @flag
					raise Jikan::FlagError, 'Flag not supported'
				end
				@url << "/#{@flag.to_s}"
			end
		end

		def get_data
			res = HTTP.get(@url)
			if res.status >= 400
				raise ClientError, "#{res.status}: error on endpoint #{@endpoint} (URL: #{@url})"
			end

			JSON.parse(res.body)
		end
  end
end