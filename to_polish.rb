t = gets.chomp.to_i
expressions = []
(1..t).each { expressions << gets }

expressions.each do |expression|
  expression = expression.split(//)
  result_expression = []
  operands = []
  expression.each do |x|
    case x
      when "-", "/", "*", "+", "^"
        operands << x
      when ")"
        result_expression << operands.pop
      when /\w/
        result_expression << x
    end
  end
  puts result_expression.join
end
