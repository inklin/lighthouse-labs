require_relative './lib/post'
require_relative './lib/comment'
require_relative './lib/parser'
require 'nokogiri'

Parser.new('post.html').run