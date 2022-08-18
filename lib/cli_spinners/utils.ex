defmodule CliSpinners.Utils do
  def ansi_prefix do
    [
      # So a shorter line can replace a previous, longer line.
      ansi_clear_line(),
      # Back to beginning of line.
      "\r"
    ]
    |> Enum.join()
  end

  def strip_invisibles(string) do
    string |> String.replace(~r/\e\[\d*[a-zA-Z]|[\r\n]/, "")
  end

  def color(content, []), do: content

  def color(content, ansi_codes) do
    [ansi_codes, content, IO.ANSI.reset()]
  end

  defp ansi_clear_line do
    IO.ANSI.clear_line()
  end
end
