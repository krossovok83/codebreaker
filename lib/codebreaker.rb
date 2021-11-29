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
    response = []
    index = 0
    attempt = attempt.to_s.scanf("%1d" * attempt.size)
    attempt.each do |i|
      response << "-" if @code.include?(i)
      response[index] = "+" if i == @code[index]
      response << "" unless @code.include?(i)
      index += 1
    end
    response.sort.join
  end

  private

  def generate
    Array.new(4) { rand(1..6) }
  end
end
