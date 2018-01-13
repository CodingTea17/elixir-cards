defmodule Cards do
  # def hello do
  #   # Elixir can be implicit or explicit (e.g. "return" vs no "return")
  #   "Hocus Pocus!"
  # end

    def create_deck do
      # Elixir convention is to use double quotes
      ["Ace", "Two", "Three"] 
    end

    # Arity = 1
    def shuffle(deck) do
      Enum.shuffle(deck)
    end
end
