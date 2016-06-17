defmodule Decanter.Step.PrepareServer do

  use Decanter.Step

  defp do_work( "any", recipe, _opts ) do
    info "Performing work for PrepareServer step"
    recipe
  end

end
