defmodule Decanter.Step.DiscoverServerState do

  use Decanter.Step

  alias Decanter.Ssh

  defp do_work( "any", recipe, _opts ) do
    Application.ensure_started(:ssh)

    Ssh.ls( recipe.servers.build, recipe.build_path )
    |> handle_ls

    recipe
  end

  defp handle_ls( {:ok, res} ) do
    Enum.each res, fn({server, entries}) ->
      warn server
      info inspect(entries)
    end
  end

  defp handle_ls( {:error, error} ) do
    raise error
  end

end
