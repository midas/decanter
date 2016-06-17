defmodule Decanter.Recipe do

  defstruct assigns: %{},
            errors: [],
            halted: false,
            repo_url: nil

  defmacro __using__( opts ) do
    quote do
      use Productive.Process, logger: unquote(Keyword.get(opts, :logger, Decanter.Logger))
    end
  end

  def init( params ) do
    %Decanter.Recipe{}
  end

end
