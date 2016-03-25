require './lib/vending'

describe 'Vending' do
  subject { Vending.new }

  describe "#insert_money" do
    context "one dime" do
      it "has one dime" do
        subject.insert_money(:dime)
        expect(subject.coins).to eq([:dime])
      end
      it "has many coins" do
        subject.insert_money(:dime)
        subject.insert_money(:nickel)
        expect(subject.coins).to eq([:dime,:nickel])
      end
    end
  end

  describe "#coin_return" do
    before do
      subject.insert_money(:dime)
      subject.insert_money(:dollar)
    end
    it "returns all the money" do
      expect(subject.coin_return).to eq([:dime, :dollar])
      expect(subject.coins).to be_empty
    end
  end

  describe "#get_a" do
    context "does not have enough money" do
      before do
        subject.insert_money(:dime)
      end
      it "gives your money back, and a sad panda" do
        item, coins = subject.get_a
        expect(item).to eq(nil)
        expect(coins).to eq([:dime])
      end
    end

    context "with enough money" do
      before do
        subject.insert_money(:dollar)
      end
      it "gives the user the item and change" do
        item, coins = subject.get_a
        expect(item).to eq(:a)
        expect(coins).to eq([:quarter, :dime])
      end
    end
  end

end






