# frozen_string_literal: true

# require_relative '../config/autoloader'

# class
class CodeBreaker
  attr_accessor :code

  def initialize
    @code = generate
  end

  def compare(attempt)
    @break = attempt.to_s.scanf("%1d" * attempt.size)
    "++++" if @code == @break
  end

  private

  def generate
    Array.new(4) { rand(1..6) }
  end
end
