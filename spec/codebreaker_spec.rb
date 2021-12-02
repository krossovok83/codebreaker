# frozen_string_literal: true

require_relative "../lib/code_breaker"

RSpec.describe CodeBreaker do
  let(:obj) { CodeBreaker.new }
  it "create new code" do
    expect(obj.code).to be_a(Array)
  end

  it "code length" do
    expect(obj.code.length).to eq(4)
  end

  it "min max" do
    expect(obj.code.min).to be >= 1
    expect(obj.code.max).to be <= 6
  end
end
RSpec.describe "6543" do
  obj = CodeBreaker.new
  obj.code = [6, 5, 4, 3]
  it "compare 5643" do
    expect(obj.compare(5643)).to eq("++--")
  end
  it "compare 6411" do
    expect(obj.compare(6411)).to eq("+-")
  end
  it "compare 6544" do
    expect(obj.compare(6544)).to eq("+++")
  end
  it "compare 3456" do
    expect(obj.compare(3456)).to eq("----")
  end
  it "compare 6666" do
    expect(obj.compare(6666)).to eq("+")
  end
  it "compare 2666" do
    expect(obj.compare(2666)).to eq("-")
  end
  it "compare 2222" do
    expect(obj.compare(2222)).to eq("")
  end
end
RSpec.describe "6666" do
  obj = CodeBreaker.new
  obj.code = [6, 6, 6, 6]
  it "compare 1661" do
    expect(obj.compare(1661)).to eq("++")
  end
end
RSpec.describe "1234" do
  obj = CodeBreaker.new
  obj.code = [1, 2, 3, 4]
  it "compare 3124" do
    expect(obj.compare(3124)).to eq("+---")
  end
  it "compare 1524" do
    expect(obj.compare(1524)).to eq("++-")
  end
  it "compare 6544" do
    expect(obj.compare(1234)).to eq("++++")
  end
end
