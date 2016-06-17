defmodule Decanter.Util do

  def server_info( server, opts \\ [] ) do
    use_char_lists = Keyword.get( opts, :char_lists, false )

    {port, others} = ~r/^(?<user>.+)@(?<server>.+):(?<port>\d+)$/
                     |> Regex.named_captures( server )
                     |> Enum.map( fn({k,v}) -> {String.to_atom(k), v} end)
                     |> Enum.partition( fn({k,v}) -> k == :port end)

    {port, _} = Keyword.get( port, :port )
                |> Integer.parse


    others = values_as_char_list( others )

    %{port: port}
    |> Map.merge( others )
  end

  def values_as_char_list( map ) do
    Enum.map( map, fn({k,v}) ->
      {k, String.to_char_list(v)}
    end)
    |> Enum.into( %{} )
  end

end
