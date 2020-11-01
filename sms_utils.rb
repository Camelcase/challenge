# frozen_string_literal: true

# supposed to contain all kind of sms utils, in this challenge used for one methond only so we can easier rspec it
# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
class SmsUtils
  # cuts text into pieces including suffix
  # could potentielly be broken up and be turned into a recursive method
  def split_into_chunks(text, chunksize = 160)
    suffix = ' - Part X of Y'
    suffix_lentgh = suffix.size
    continue = 1
    chunks = []
    textcopy = text
    chunk_count = 0
    counter_digits = 1
    while continue == 1
      continue = 0
      chunk = textcopy
      chunk_count += 1 unless chunk.empty?
      if chunk_count.to_s.size.to_i > counter_digits
        counter_digits = chunk_count.to_s.size.to_i
        textcopy = text
        chunks = []
        continue = 1
        chunk_count = 0
        next
      end
      n = chunksize - (suffix_lentgh - 1 + chunk_count.to_s.size.to_i + counter_digits)
      if textcopy.size > n
        continue = 1
        chunk = textcopy[0..n]
        textcopy = textcopy[(n + 1)..-1]
      end
      chunks.push(chunk) unless chunk.empty?
    end
    chunks.each_with_index do |_n, i|
      tmp_suffix = +suffix.gsub('X', (i + 1).to_s)
      tmp_suffix = tmp_suffix.gsub('Y', chunk_count.to_s)
      chunks[i] = chunks[i] + tmp_suffix
    end
    chunks
  end

  def generate_code(size = 360)
    charset = %w[2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z]
    (0...size).map { charset.to_a[rand(charset.size)] }.join
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength
