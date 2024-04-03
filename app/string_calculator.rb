class StringCalculator
  def self.add(numbers)
    new_array = []
    numbers.each do |number|
    delimiter = detect_delimiter(number)
    numbers = remove_delimiter_declaration(number)

    new_array << number.split(/#{delimiter}|\n/)
           .map(&:to_i)
           .tap { |nums| check_negatives(nums) }
           .sum
    end 
    puts new_array
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