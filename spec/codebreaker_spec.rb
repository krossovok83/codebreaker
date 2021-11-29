# frozen_string_literal: true

require_relative "../config/autoloader"

RSpec.describe "Codebreaker" do
  context "Checking new code" do
    let(:new_code) { CodeBreaker.new.code }
    it "create new code" do
      expect(new_code).to be_a(Array)
    end

    it "code length" do
      expect(new_code.length).to eq(4)
    end

    it "min max" do
      expect(new_code.min).to be >= 1
      expect(new_code.max).to be <= 6
    end
  end
end
