require 'addressable/uri'
require 'nokogiri'
require 'net/http'

class SearchUniversity
  def search_university(university, retry_count = 10)
    raise ArgumentError, 'too many HTTP redirects' if retry_count.zero?

    uri = Addressable::URI.parse("http://webservice.recruit.co.jp/shingaku/school/v1/?key=5f41f9c3dda79e9d&name=#{university}")

    begin
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end

      case response
      when Net::HTTPSuccess
        doc = Nokogiri::XML(response.body)
        hash = Hash.from_xml(doc.to_s)
        if 1.zero?
          nil
        else
          hash
        end

      when Net::HTTPRedirection
        location = response['location']
        Rails.logger.error(warn("redirected to #{location}"))
        search_area(form_words, start_date, end_date, retry_count - 1)
      else
        Rails.logger.error([uri.to_s, response.value].join(' : '))
      end
    rescue StandardError => e
      Rails.logger.error(e.message)
      raise e
    end
  end
end
