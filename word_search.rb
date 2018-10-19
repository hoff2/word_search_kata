#!/usr/bin/env ruby

require './lib/search.rb'

search = WordSearch::Search.from_file_contents(ARGF.read)
puts search.word_locations_report
