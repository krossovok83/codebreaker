# frozen_string_literal: true

# require_relative '../config/autoloader'

# class
class CodeBreaker
  attr_accessor :code

  def initialize
    @code = generate
  end

  # noinspection RubyResolve
  def compare(attempt)
    @code_attempt = @code.dup
    @response = []
    @index = 0
    attempt.to_s.scanf("%1d" * attempt.size).each(&method(:calculate))
    @response.sort.join
  end

  private

  def generate
    Array.new(4) { rand(1..6) }
  end

  def calculate(element)
    if element == @code_attempt[@index]
      (@response << "+") && (@code_attempt[@code_attempt.index(element)] = "")
    elsif @code_attempt.include?(element)
      (@response << "-") && (@code_attempt[@code_attempt.index(element)] = "")
    end
    @index += 1
  end
end
