# Sitelink Generator

[DigitalGov Search](http://search.digitalgov.gov) powers the search box on 1,500 government websites. 

This sitelink generator "decorates" organic web results to provide additional, value-added links to help searchers find what they're looking for.

See the sample results page below that shows sitelink-generated links for EDGAR filings for a search on *apple* on SEC.gov.

![Sitelink-generated links for EDGAR filings on SEC.gov](https://9fddeb862c037f6d2190-f1564c64756a8cfee25b6b19953b1d23.ssl.cf2.rackcdn.com/sitelink.png "Sitelink-generated links for EDGAR filings on SEC.gov")

## Installation

Add sitelink_generator to your `Gemfile` and `bundle install`:

```ruby
gem 'sitelink_generator'
```

## Available Generators

[Available generators](lib/sitelink_generator/generators/) include:

* [SecEdgar](lib/sitelink_generator/generators/sec_edgar.rb)

## Usage

```ruby
require 'sitelink_generator'

url = 'http://www.sec.gov/Archives/edgar/data/1577552/000119312514184994/d709111df1.htm'
SitelinkGenerator::SecEdgar.generate url
#=> [{:title=>"Full Filing",
#     :url=>"http://www.sec.gov/Archives/edgar/data/1577552/0001193125-14-184994-index.htm"},
#    {:title=>"Most Recent Filings for this Company",
#     :url=>"http://www.sec.gov/cgi-bin/browse-edgar?CIK=1577552&Find=Search&action=getcompany&owner=exclude"}]
```

## Supported Ruby Versions

* Ruby 2.1

## Feedback

If you think you found a bug in SitelinkGenerator, you can [submit an issue](https://github.com/GSA/sitelink_generator/issues/new).
