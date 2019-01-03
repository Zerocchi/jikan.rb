require "http"
require "json"
require "uri"

module Jikan
  class API

    def initialize(use_ssl=true)
			@endpoint = ""
			@id = nil
			@flag = nil
			@year = nil
			@page = nil
			@query = nil
			@selected_base = if use_ssl then Jikan::BASE_URL_V3_SSL else Jikan::BASE_URL_v3 end
		end

		def get(endpoint:, flag: nil, id: 0, query: nil, year: Date.today.year, page: 1)
			@endpoint = endpoint
			@id = id
			@flag = flag
			@query = query
			@year = year
			@page = page

			construct_url
			get_data
		end

    private

		def construct_url
			@end_url = "#{@selected_base}/#{@endpoint}"

			unless @flag.nil? || Jikan::FLAGS[@endpoint].include?(@flag)
				raise Jikan::FlagError, 'Flag not supported'
			end

      if @endpoint.eql?('season')
				if @flag.eql?(:later)
					@url = URI.encode("#{@end_url}/#{@flag}")
				elsif
					@url = URI.encode("#{@end_url}/#{@year}/#{@flag}")
				end
			elsif @endpoint.eql?('search')
				@url = URI.encode("#{@end_url}/#{@flag.to_s}?q=#{@query}&page=#{@page}")
			elsif @endpoint.eql?('user')
				@url = URI.encode("#{@end_url}/#{@query}/#{@flag.to_s}")
			else
				@url = "#{@end_url}/#{@id}"
				unless @flag.nil?
					@url << "/#{@flag.to_s}"
				end
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