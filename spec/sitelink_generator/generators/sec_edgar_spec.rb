require 'spec_helper'

RSpec.describe SitelinkGenerator::SecEdgar do
  describe '.generate' do
    it 'returns [] when the input url does not match' do
      urls = %w(test.sec.gov
                www.sec.gov/Archives/edgar/data/not/number/
                http://www.sec.gov/Archives/edgar/data/123/456/ends-with-index.htm)
      urls.each do |url|
        expect(described_class.generate(url)).to be_empty
      end
    end

    it 'returns generated urls when the input url matches' do
      urls = %w(http://sec.gov/Archives/edgar/data/831001/000119312507038505/dex2101.htm
                http://www.sec.gov/Archives/edgar/data/831001/000119312507038505/dex2101.htm)
      expected_urls = [{ title: 'Full Filing',
                         url: 'http://www.sec.gov/Archives/edgar/data/831001/0001193125-07-038505-index.htm' },
                       { title: 'Most Recent Filings for this Company',
                         url: 'http://www.sec.gov/cgi-bin/browse-edgar?CIK=831001&Find=Search&action=getcompany&owner=exclude' }]

      urls.each do |url|
        expect(described_class.generate(url)).to eq(expected_urls)
      end
    end
  end
end
