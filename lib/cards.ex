defmodule Cards do
  # def hello do
  #   # Elixir can be implicit or explicit (e.g. "return" vs no "return")
  #   "Hocus Pocus!"
  # end

  def create_deck do
    # Elixir convention is to use double quotes
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  
  # ? bool 
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Arity = 1
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = File.read(filename)
    :erlang.binary_to_term(binary)
  end
end
