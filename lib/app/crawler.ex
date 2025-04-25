# defmodule App.Crawler do
#   @names ~w(Ashley Alex)

#   # in liveview mount

#   def search_all() do
#     Enum.each(@names, & search(&1))
#   end

#   def search(name) do
#     # api request get list of results

#     # show immediate results in liveview

#     # for each result
#     # query own postgres table to see if there is a match

#     case App.get_player!(params) do
#       nil ->
#         # add player

#       player ->
#         # update or skip
#     end
#   end
# end
