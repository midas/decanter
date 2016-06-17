defmodule Decanter.Recipe do

  defstruct assigns: %{},
            build_path: nil,
            deploy_to: nil,
            deploy_user: nil,
            errors: [],
            halted: false,
            repo_url: nil,
            servers: %{
              app: [],
              build: [],
              db: [],
              worker: []
            }

  defmacro __using__( opts ) do
    quote do
      use Productive.Process, logger: unquote(Keyword.get(opts, :logger, Decanter.Logger))
    end
  end

  def init( params ) do
    %Decanter.Recipe{
      build_path: Keyword.get( params, :build_path ),
      deploy_to: Keyword.get( params, :deploy_to ),
      deploy_user: Keyword.get( params, :deploy_user ),
      repo_url: Keyword.get( params, :repo_url ),
      servers: Keyword.get( params, :servers )
    }
  end

end
