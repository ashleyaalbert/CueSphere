defmodule App.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        attributes: 42,
        name: "some name"
      })
      |> App.Items.create_item()

    item
  end
end
