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

    context "all spares with a first ball of 4" do
      let(:score) { [[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6,4]] }
      it { is_expected.to eq(140) }
    end

    context "9 strikes and a gutter ball" do
      let(:score) { [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[0,0]] }
      it { is_expected.to eq(240) }
    end

  end
end