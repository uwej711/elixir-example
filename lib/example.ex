defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Example.hello()
      :world

  """
  def hello do
    IO.puts("world")
  end

  def hello(name) do
    IO.puts(name)
  end

  def main([name]) do
    hello(name)
  end
end
