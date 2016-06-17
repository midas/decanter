defmodule Decanter.Ssh do

  import Decanter.Async
  import Decanter.Logger

  alias Decanter.Util

  def ls( servers, path ) do
    servers = List.wrap( servers )

    #info "Listing `#{path}` for servers: #{inspect servers}"

    cmd = "ls #{path}"
          |> String.to_char_list

    results = parallelize( servers, &do_ls/3, [path, cmd] )
    # TODO possibly check for any errors and relect in this response: {:error, errors, results}

    {:ok, results}
  end

  # Private #########

  defp do_ls( server, path, cmd ) do
    debug "Listing `#{path}` for `#{server}`"
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
