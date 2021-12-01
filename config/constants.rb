# frozen_string_literal: true

DIFFICULTY = {
  easy: { attempts: 15, hints: 2 },
  medium: { attempts: 10, hints: 1 },
  hell: { attempts: 5, hints: 0 }
}.freeze
COMMANDS = %w[start rules stats exit].freeze
COMMANDS_ON_PLAY = %w[hint exit].freeze
