defmodule Decanter.Step do

  defstruct assigns: %{}

  defmacro __using__( opts ) do
    quote do
      use Productive.Step, logger: unquote(Keyword.get(opts, :logger, Decanter.Logger))
    end
  end

end
