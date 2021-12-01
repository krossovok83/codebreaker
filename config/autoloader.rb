# frozen_string_literal: true

parent_dir = File.dirname(File.dirname(__FILE__))
require_relative "../lib/codebreaker/version"
require_relative "constants"
require "pry"
# noinspection RubyResolve
require "scanf"

autoload :CodeBreaker, "#{parent_dir}/lib/codebreaker"
autoload :GamePlay, "#{parent_dir}/lib/game_play"
