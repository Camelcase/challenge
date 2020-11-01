# frozen_string_literal: true

require './sms_utils'

puts '----------------------'
text = SmsUtils.new.generate_code(140)
puts text
puts '----------------------'
data = SmsUtils.new.split_into_chunks(text, 20)
puts data
puts '----------------------'
puts data.size
