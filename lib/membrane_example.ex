defmodule MembraneExample do
  use Membrane.Pipeline

  @impl true
  def handle_init(_ctx, %{target: target, input: input, output: output}) do
    spec =
      child(%Membrane.File.Source{location: input})
      |> child(:decoder, Membrane.MP3.MAD.Decoder)
      |> child(%Membrane.FFmpeg.SWResample.Converter{
        output_stream_format: %Membrane.RawAudio{
          channels: 2,
          sample_format: :s16le,
          sample_rate: 44_100
        }
      })      |> child(:aac_encoder, Membrane.AAC.FDK.Encoder)
      |> child(:sink, %Membrane.File.Sink{location: output})

    {[spec: spec], %{target: target}}
  end

  @impl true
  def handle_element_end_of_stream(:sink, :input, _ctx, state) do
    send(state.target, :done)
    {[], state}
  end
end
