require './lib/bowling'

describe 'Bowling' do
  describe "#score" do
    subject { Bowling.score(score) }
    let(:score) { }
    it { is_expected.to eq(0) }

    context "gutter balls" do
      let(:score) { [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]] }
      it { is_expected.to eq(0) }
    end

    context "all three" do
      let(:score) { [[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3]] }
      it { is_expected.to eq(60) }
    end


  end
end