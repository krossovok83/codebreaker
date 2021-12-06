# frozen_string_literal: true

require "fileutils"
require "yaml"

RESULT = "result/result.yml"
RESULT_DIR = "result"
RULES = "#{__dir__}/lib/codebreaker/rules.txt"
PLUS = "+"
MINUS = "-"
ARRAY_FOR_STATS = %w[hell medium easy].freeze
NUMBER_OF_SIGNS = 4
RANGE_CODE = (1..6).freeze
WIN = "+++"
