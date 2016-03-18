require './lib/frame'

describe 'Frame' do
  describe "#score" do
    subject { Frame.new(score).score }

    context "gutter frame" do
      let(:score) { [0,0] }
      it { is_expected.to eq(0) }
    end

    context "regular frame" do
      let(:score) { [3,3] }
      it { is_expected.to eq(6) }
    end

    context "spare frame" do
      let(:score) { [0,10] }
      it { is_expected.to eq(10) }
    end

    context "strike frame" do
      let(:score) { [10,0] }
      it { is_expected.to eq(10) }
    end

  end

  describe "#strike?" do
    subject { Frame.new(score).strike? }

    context "gutter frame" do
      let(:score) { [0,0] }
      it { is_expected.to be_falsey }
    end

    context "regular frame" do
      let(:score) { [3,3] }
      it { is_expected.to be_falsey }
    end

    context "spare frame" do
      let(:score) { [0,10] }
      it { is_expected.to be_falsey }
    end

    context "strike frame" do
      let(:score) { [10,0] }
      it { is_expected.to be_truthy }
    end
  end

  describe "#spare?" do
    subject { Frame.new(score).spare? }

    context "gutter frame" do
      let(:score) { [0,0] }
      it { is_expected.to be_falsey }
    end

    context "regular frame" do
      let(:score) { [3,3] }
      it { is_expected.to be_falsey }
    end

    context "spare frame" do
      let(:score) { [0,10] }
      it { is_expected.to be_truthy }
    end

    context "strike frame" do
      let(:score) { [10,0] }
      it { is_expected.to be_falsey }
    end
  end
end