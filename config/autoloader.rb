# frozen_string_literal: true

parent_dir = File.dirname(File.dirname(__FILE__))
require_relative "../lib/codebreaker/version"
require "pry"
# noinspection RubyResolve
require "scanf"

autoload :CodeBreaker, "#{parent_dir}/lib/codebreaker"
