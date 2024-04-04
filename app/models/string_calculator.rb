class StringCalculator
  def self.add(numbers)
    delimiter = detect_delimiter(numbers)
    numbers = remove_delimiter_declaration(numbers)

    new_array = numbers.split(/#{delimiter}|\n/)
           .map(&:to_i)
           .tap { |nums| check_negatives(nums) }
           .sum
    return new_array
  end

  private

  def self.detect_delimiter(numbers)
    match = numbers.match(/^\/\/(.*)\n/)
    match ? Regexp.escape(match[1]) : ","
  end

  def self.remove_delimiter_declaration(numbers)
    numbers.gsub(/^\/\/.*\n/, "")
  end

  def self.check_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
  end
end