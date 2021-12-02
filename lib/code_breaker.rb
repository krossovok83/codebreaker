# frozen_string_literal: true

require "codebreaker/constants"
require "pry"
require "fileutils"
require "yaml"

# class
class CodeBreaker
  RESULT = "result/result.yml"
  RULES = "#{__dir__}/codebreaker/rules.txt"
  attr_accessor :code, :attempts_left

  def initialize(attempts, hints)
    @attempts = attempts
    @attempts_left = attempts
    @hints = hints
    @hints_left = hints
    @code = generate
    @variant_for_hints = [0, 1, 2, 3]
  end

  def compare(attempt)
    @code_attempt = @code.dup
    @response = []
    @index = 0
    attempt.to_s.each_char.map(&:to_i).each(&method(:calculate))
    @attempts_left -= 1
    return @response.join if @response.join == "++++"

    return nil if @attempts_left.zero?

    @response.sort.join
  end

  def hint
    i = @variant_for_hints.delete(@variant_for_hints.sample)
    if @hints_left.nonzero?
      @hints_left -= 1
      return "One of the numbers - #{@code[i]}, #{@hints_left} hint left"
    end
    "You have used all the hints"
  end

  def self.rules
    puts File.readlines(RULES)
  end

  def save(name, difficulty)
    hash = { "#{name}": { difficulty: difficulty,
                          attempts: @attempts,
                          attempt_used: @attempts - @attempts_left,
                          hints: @hints,
                          hints_used: @hints - @hints_left } }
    FileUtils.mkdir_p "result"
    File.open(RESULT, "a") { |file| file.write(hash.to_yaml) }
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
