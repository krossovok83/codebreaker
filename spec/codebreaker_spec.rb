# frozen_string_literal: true

RSpec.describe CodeBreaker do
  let(:obj) { CodeBreaker.new(15, 2) }
  it "create new code" do
    expect(obj.code).to be_a(Array)
  end

  it "code length" do
    expect(obj.code.length).to eq(4)
  end

  it "min max" do
    expect(obj.code.min).to be_between(1, 6)
  end

  it "hint" do
    expect(obj.hint).to be_a(Integer)
    expect(obj.hint).to be_between(1, 6)
    expect(obj.hint).to be_nil
  end

  it "rules" do
    stub_const("RULES", "LICENSE.txt")
    expect(described_class.rules).to be_a(Array)
  end
end
RSpec.describe CodeBreaker do
  let(:obj) { CodeBreaker.new(15, 2) }
  before do
    stub_const("RESULT_DIR", "test")
    stub_const("RESULT", "test/test.yml")
  end

  after(:all) do
    FileUtils.rm_rf(Dir["test"])
  end

  it "save" do
    obj.save("Some_name", "easy")
    expect(File.exist?("test/test.yml")).to be true
  end

  it "stats" do
    expect(described_class.stats).to be_a(Array)
  end
end
RSpec.describe "6543" do
  obj = CodeBreaker.new(15, 2)
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
  obj = CodeBreaker.new(15, 2)
  obj.code = [6, 6, 6, 6]
  it "compare 1661" do
    expect(obj.compare(1661)).to eq("++")
  end
end
RSpec.describe "1234" do
  obj = CodeBreaker.new(15, 2)
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
