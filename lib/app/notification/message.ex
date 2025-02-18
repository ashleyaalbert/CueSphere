defmodule App.Notification.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message, :string
    field :email, :string
    field :subject, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:email, :subject, :message])
    |> validate_required([:email, :message])
    |> validate_format(:email, ~r/@/, message: "Must contain @ symbol!")
    |> validate_length(:subject, max: 30, message: "Only 30 characters max!")
    |> validate_length(:message, min: 5, max: 255, message: "Subject must have a minimum of 5 chracters and a maximum of 255!")
  end
end
