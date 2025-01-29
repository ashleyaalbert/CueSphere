test "testing /planets/random", %{conn: conn} do
  # Set a seed so we always get the same "random" numbers when testing
  :rand.seed(:exsss, {100, 101, 102})

  conn = get(conn, ~p"/planets/random")
  # assert for as specific planet in your output (the one determined by seed)

  # call conn = get(...) again
  # assert for a different planet in your output
end
