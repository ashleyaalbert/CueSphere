defmodule App.Scraper do
  def get_page_title(url) do
    case HTTPoison.get(url) do
      {:ok, %{body: body}} ->
        title = Floki.find(body, "title") |> Floki.text()
        {:ok, title}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
