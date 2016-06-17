class Foobar

  def self.first_hundred
    Foobar.new.parse(nums: 1..100)
  end

  def parse(nums:, include_others: false, as_array: false)
    if nums.respond_to?(:map)
      result = nums.map { |n| foobar?(n) ? "#{n}: foobar" : foo?(n) ? "#{n}: foo" : bar?(n) ? "#{n}: bar" : include_others ? n.to_s : next }.compact if 1 / nums&.first.to_i
    end
    return 'No numbers were parsed.' unless result&.any?
    print "\n#{result.join(", \n")} \n"
    return result.join(', ') unless as_array
    return result
  rescue ZeroDivisionError
    print 'Please enter numbers or strings of numbers.'
    return 'Please enter numbers or strings of numbers.'
  end

  private

  def foo?(num)
    num.to_i % 3 == 0
  end

  def bar?(num)
    num.to_i % 5 == 0
  end

  def foobar?(num)
    num.to_i % 15 == 0
  end
end
