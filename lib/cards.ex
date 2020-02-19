defmodule Cards do
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

    for suit <- suits, value <-values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

end
