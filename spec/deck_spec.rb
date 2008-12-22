require File.dirname(__FILE__) + '/helper'

describe Deck, '#next' do
  it 'should give you the number of cards you ask for' do
    count = rand 10
    Deck.new.next(count).length.should == count
  end

  it 'should give 1 card by default' do
    Deck.new.next.length.should == 1
  end

  it 'should not give out the same card twice' do
    Deck.new.next(52).uniq.length.should == 52
  end

  it 'should not give out the same card(s) on subsequent calls' do
    deck = Deck.new
    count = rand 10
    deck.next(count).should_not == deck.next(count)
  end

  it 'should eventually run out of cards' do
    lambda {
      Deck.new.next(53)
    }.should raise_error(IndexError)
    lambda {
      deck = Deck.new
      deck.next 40
      deck.next 13
    }.should raise_error(IndexError)
  end
end
