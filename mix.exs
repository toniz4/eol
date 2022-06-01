defmodule Eol.MixProject do
  use Mix.Project

  def project do
    [app: :eol, version: "0.0.1", escript: [main_module: Eol.CLI]]
  end
end
