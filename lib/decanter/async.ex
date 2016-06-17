defmodule Decanter.Async do

  def parallelize( coll, fun, args \\ [] ) do
    coll
    |> Enum.map( fn(el) ->
         Task.async(fn ->
           apply(fun, [el|args])
         end)
       end)
    |> Enum.map( fn(task) -> Task.await(task) end )
  end

end
