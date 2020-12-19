defmodule DrawableMap.Geo.Polygon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polygons" do
    field :coordinates, {:array, {:array, {:array, :float}}}

    timestamps()
  end

  @doc false
  def changeset(polygon, attrs) do
    polygon
    |> cast(attrs, [:coordinates])
    |> validate_required([:coordinates])
  end
end
