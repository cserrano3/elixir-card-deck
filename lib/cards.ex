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

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)
    File.write(fileName, binary)
  end

  def load(fileName) do
    # Reminds me of the the 'when' statement in Kotlin
    # :ok -> primitive data type called atom, for status code. Atoms can be
    # understood as strings, but are not displayed for the user. They're only used for
    # status checking
    case File.read(fileName) do
      {:ok, binary} -> :erlang.binary_to_term binary # pattern matching can be used as a case statement for comparison and assignment
      {:error, _reason} -> "That file does not exist."
    end
  end

  def createHand(handSize) do
    # deck = Cards.createDeck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck,handSize)

    # The pipe operator performs point-free style operations like JavaScript currying.
    Cards.createDeck
    |> Cards.shuffle
    |> Cards.deal(handSize)
  end
end
