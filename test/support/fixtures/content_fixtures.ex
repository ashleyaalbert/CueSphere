defmodule App.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Content` context.
  """

  @doc """
  Generate a unique topic slug.
  """
  def unique_topic_slug, do: "some slug#{System.unique_integer([:positive])}"

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        slug: unique_topic_slug(),
        title: "some title"
      })
      |> App.Content.create_topic()

    topic
  end
end
