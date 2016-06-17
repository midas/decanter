defmodule Decanter.Logger do

  def debug( msg ) when is_list(msg) do
    log_with_ansi( msg )
  end

  def debug( msg ), do: debug( [:cyan, msg] )

  def error( msg ) when is_list(msg) do
    log_with_ansi( msg )
  end

  def error( msg ), do: warn( [:red, msg] )

  def info( msg ) when is_list(msg) do
    log_with_ansi( msg )
  end

  def info( msg ), do: IO.puts( msg )

  def warn( msg ) when is_list(msg) do
    log_with_ansi( msg )
  end

  def warn( msg ), do: warn( [:yellow, msg] )

  def step_info( msg ) do
    info [:cyan, msg]
  end

  defp log_with_ansi( msg ) when is_list(msg) do
    msg
    |> IO.ANSI.format
    |> IO.puts
  end

end
