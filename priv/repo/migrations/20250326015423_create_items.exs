defmodule App.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :attributes, :smallint
      add :type, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
