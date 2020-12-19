defmodule DrawableMap.Repo.Migrations.CreatePolygons do
  use Ecto.Migration

  def change do
    create table(:polygons) do
      add :coordinates, :map

      timestamps()
    end
  end
end
