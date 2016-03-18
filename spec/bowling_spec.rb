require './lib/bowling'

describe 'Bowling' do
  describe "#score" do
    subject { Bowling.new.score }
    it { is_expected.to eq(0) }
  end
end