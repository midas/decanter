defmodule Decanter.Ssh do

  import Decanter.Logger

  alias Decanter.Util

  def ls( servers, path ) do
    servers = List.wrap( servers )

    #info "Listing `#{path}` for servers: #{inspect servers}"

    cmd = "ls #{path}"
          |> String.to_char_list

    results = servers
              |> Enum.map( fn(server) -> Task.async(fn -> do_ls(cmd, server, path) end) end)
              |> Enum.map( fn(task) -> Task.await(task) end )

    {:ok, results}
  end

  defp do_ls( cmd, server, path ) do
    info "Listing `#{path}` for `#{server}`"
    server_info = Decanter.Util.server_info( server )

    case SSHEx.connect( ip: server_info.server, port: server_info.port, user: server_info.user ) do
      {:ok, conn} ->
        SSHEx.run( conn, cmd )
        |> handle_do_ls( server )
      {:error, error} ->
        {:error, error}
    end
  end

  def handle_do_ls( {:ok, res, 0}, server ), do: {server, String.split( res )}
  def handle_do_ls( {:error, error}, _ ),    do: {:error, error}

end
