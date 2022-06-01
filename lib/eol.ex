# This software is in the public domain.

defmodule Eol do
  defp rainbow(i) do
    red = :math.sin(0.1 * i + 0) * 127 + 128
    green = :math.sin(0.1 * i + 2 * :math.pi() / 3) * 127 + 128
    blue = :math.sin(0.1 * i + 4 * :math.pi() / 3) * 127 + 128

    [red, green, blue]
    |> Enum.map(&trunc(&1))
  end

  def loop(acc \\ 0) do
    case IO.read(1) do
      :eof ->
        :ok

      char ->
        [r, g, b] = rainbow(acc)

        IO.write("\e[38;2;#{r};#{g};#{b}m#{char}\e[0m")

        loop(acc + 1)
    end
  end
end

defmodule Eol.CLI do
  def main(_args \\ []) do
    Eol.loop()
  end
end
