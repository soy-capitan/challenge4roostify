#!/usr/bin/env ruby
require 'watir'

browser = Watir::Browser.new
browser.goto 'google.com'
browser.text_feild(title: 'Search').set 'Hello World!'
browser.button(type: 'submit').click

puts browser.title
# => 'Hello World! - Google Search'
browser.close