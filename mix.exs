defmodule Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_example,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:membrane_core, "~> 1.0"},
      {:membrane_file_plugin, "~> 0.17.0"},
      {:membrane_aac_fdk_plugin, "~> 0.18.10"},
      {:membrane_mp3_mad_plugin, "~> 0.18.4"},
      {:membrane_ffmpeg_swresample_plugin, "~> 0.20.2"}
    ]
  end
end
