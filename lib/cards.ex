defmodule Cards do
  @moduledoc """
    A collection of methods for creating, handiling, and storing decks of cards
  """

  # def hello do
  #   # Elixir can be implicit or explicit (e.g. "return" vs no "return")
  #   "Hocus Pocus!"
  # end

  @doc """
    Returns a list of strings that represent a deck of cards 
  """
  def create_deck do
    # Elixir convention is to use double quotes
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a boolean. Determines whether a card is in a given deck,

  ## Examples
  
    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Arity = 1
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Splits a deck into a hand and the remainder of the deck. It takes a deck and a hand_size as arguments.

  ## Examples
  
      iex> deck = Cards.create_deck
      iex> { hand, deck } = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # ATOMS! 
    case File.read filename do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, reason } -> "That file does not exist"
    end    
  end

  def create_hand(hand_size) do
    # Pipe operator, use consistent first args
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
