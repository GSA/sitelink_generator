require 'active_support/core_ext/object/to_query'
require 'uri'

module SitelinkGenerator
  class SecEdgar
    include SitelinkGenerator::Base

    self.url_prefix = 'www.sec.gov/Archives/edgar/data/'.freeze

    MATCHING_URL_REGEX = %r{^(?!.*-index\.htm$)https?://(www\.)?sec\.gov/Archives/edgar/data/\d+/\d+\/.+$}i

    DEFAULT_BROWSE_EDGAR_PARAMS = {
      Find: 'Search',
      action: 'getcompany',
      owner: 'exclude'
    }.freeze

    def self.generate(url)
      return [] unless url =~ MATCHING_URL_REGEX

      path_as_array = URI.parse(url).path.split('/')
      return [] unless path_as_array.length == 7

      [generate_full_filing_url(path_as_array),
       generate_browse_edgar_url(path_as_array)]
    end

    def self.generate_browse_edgar_url(path_as_array)
      title = I18n.t(:'sitelink_generator.sec_edgar.most_recent_filings')

      cik = path_as_array[4]
      url_params = DEFAULT_BROWSE_EDGAR_PARAMS.merge(CIK: cik)
      url = "http://www.sec.gov/cgi-bin/browse-edgar?#{url_params.to_param}"

      { title: title, url: url }
    end

    def self.generate_full_filing_url(path_as_array)
      cik = path_as_array[4]
      cik_part_1 = path_as_array[5].slice(0, 10)
      cik_part_2 = path_as_array[5].slice(10, 2)
      cik_part_3 = path_as_array[5].slice(12..-1)

      full_filing_path = "#{cik}/#{cik_part_1}-#{cik_part_2}-#{cik_part_3}-index.htm"
      url = "http://www.sec.gov/Archives/edgar/data/#{full_filing_path}"

      { title: I18n.t('sitelink_generator.sec_edgar.full_filing'), url: url }
    end
  end
end
