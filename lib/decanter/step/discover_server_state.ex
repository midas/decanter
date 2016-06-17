defmodule Decanter.Step.DiscoverServerState do

  use Decanter.Step

  defp do_work( "any", recipe, _opts ) do
    info "Performing work for DiscoverServerState step"
    recipe
  end

end
