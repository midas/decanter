defmodule Decanter.Logger do

  def info( msg ) when is_list(msg) do
    msg
    |> IO.ANSI.format
    |> IO.puts
  end

  def info( msg ), do: IO.puts( msg )

  def step_info( msg ) do
    info [:cyan, msg]
  end

end
