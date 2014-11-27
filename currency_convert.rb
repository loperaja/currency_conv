#!/usr/bin/env ruby

require 'net/http'

amount = ARGV[0]
from = ARGV[1].to_s
to = ARGV[2].to_s

def convert_currency(from_curr, to_curr, amount)
    host = "www.google.com"
    http = Net::HTTP.new(host, 80)
    url = "/finance/converter?a=#{amount}&from=#{from_curr}&to=#{to_curr}"
    response = http.get(url)
    # puts response.body
    result = response.body
    regexp = Regexp.new("(\\d+\\.{0,1}\\d*)\\s+#{to_curr}")
    regexp.match result
    return $1.to_f
end

puts convert_currency(from, to, amount)

