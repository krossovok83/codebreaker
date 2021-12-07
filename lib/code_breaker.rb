# frozen_string_literal: true

require_relative "../autoload"

class CodeBreaker
  attr_accessor :code, :attempts_left, :hints

  def initialize(attempts, hints)
    @attempts = attempts
    @attempts_left = attempts
    @hints = hints
    @hints_for_stat = hints
    @code = generate
    @variant_for_hints = [0, 1, 2, 3]
  end

  def compare(attempt)
    @code_attempt = @code.dup
    @response = []
    @index = 0
    attempt.each(&method(:calculate))
    @attempts_left -= 1
    return @response.join if @response.join == WIN

    return nil if @attempts_left.zero?

    @response.sort.join
  end

  def hint
    i = @variant_for_hints.delete(@variant_for_hints.sample)
    if hints.nonzero?
      self.hints -= 1
      return @code[i]
    end
    nil
  end

  def self.stats
    return unless File.exist?(RESULT)

    hash = {}
    YAML.load_stream(File.open(RESULT)) { |document| hash.merge!(document) }
    hash.sort_by do |_name, param|
      [ARRAY_FOR_STATS.find_index(param[:difficulty]), param[:attempt_used], param[:hints_used]]
    end
  end

  def self.rules
    File.readlines(RULES)
  end

  def save(name, difficulty)
    hash = { "#{name}": { difficulty: difficulty,
                          attempts: @attempts,
                          attempt_used: @attempts - @attempts_left,
                          hints: @hints_for_stat,
                          hints_used: @hints_for_stat - self.hints } }
    FileUtils.mkdir_p RESULT_DIR
    File.open(RESULT, "a") { |file| file.write(hash.to_yaml) }
  end

  private

  def generate
    Array.new(NUMBER_OF_SIGNS) { rand(RANGE_CODE) }
  end

  def calculate(element)
    if element == @code_attempt[@index]
      (@response << PLUS) && clear_element_after_calculate(element)
    elsif @code_attempt.include?(element)
      (@response << MINUS) && clear_element_after_calculate(element)
    end
    @index += 1
  end

  def clear_element_after_calculate(element)
    @code_attempt[@code_attempt.index(element)] = ""
  end
end
