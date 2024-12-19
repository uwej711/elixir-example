defmodule Example do
  @moduledoc """
  Documentation for `Example`.
  """

  def convert(input, output) do
    {:ok, _supervisor, pid} =
      Membrane.Pipeline.start_link(MembraneExample, %{input: input, output: output, target: self()})

    receive do
      :done -> Membrane.Pipeline.terminate(pid)
    end
  end
end
