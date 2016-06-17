defmodule Mix.Tasks.Decanter.Deploy do
  use Mix.Task

  @shortdoc "Execute deployment recipe `config/deploy.exs`"

  def run(args) do
    Code.require_file("config/deploy.exs")
    #IO.inspect args
    #Mix.shell.info "Hello, World!"
  end
end
