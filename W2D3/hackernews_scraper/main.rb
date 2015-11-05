require_relative './lib/post'
require_relative './lib/comment'
require_relative './lib/parser'
require_relative './lib/scraper'

require 'open-uri'
require 'nokogiri'
require 'colorize'

url = ARGV[0]
Scraper.new(url).run