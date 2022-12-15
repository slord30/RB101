# ask the user for two numbers
# ask the user for an operation to perform
# perfom the operation of the two numbers
# output the result

# answer = Kernel.gets() --> 'answer' is the variable we are saving to
# Kernel.puts(answer) --> 'Kernel' is the modulewhere the method gets and puts lives
# () is how we do a method call, they are optional

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  word = case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
    end

  word
end

def integer?(input)
  input.to_i.to_s == input
end


prompt "Welcome to Calculator! Enter your name:"
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt ("Make sure to use a valid name.")
  else
    break
  end
end

prompt "Hi #{name}"

loop do #main loop

  number1 = ''  #must put this outside the loop block or the case operator can't access "number1" because it's scope was defined inside the block
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt ("Hmm...that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt ("Hmm...that doesn't look like a valid number.")
    end
  end
  
  operator_prompt = <<-MSG #MSG can be anything you want. They are delimiters. Must match the end delimiter.
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  #prompt "What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
  
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Must choose 1, 2, 3, or 4"
    end
  end

  #if operator == "1"
    result = number1.to_i + number2.to_i
  #elsif operator == "2"
  #  result = number1.to_i - number2.to_i
  #elsif operator == "3"
  #  result = number1.to_i * number2.to_i
  #elsif operator == "4"
  #  result = number1.to_f / number2.to_f
  #end

  prompt "#{operation_to_message(operator)} the two numbers #{number1} and #{number2}..."
  
  result = case operator
  when '1'
    number1.to_i + number2.to_i
  when '2'
    number1.to_i - number2.to_i
  when '3'
    number1.to_i * number2.to_i
  when '4'
    number1.to_f / number2.to_f
  end

  prompt "Your result is #{result}."

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using calculator!"