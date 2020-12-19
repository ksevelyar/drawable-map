defmodule DrawableMapWeb.PolygonView do
  use DrawableMapWeb, :view
  alias DrawableMapWeb.PolygonView

  def render("index.json", %{polygons: polygons}) do
    %{data: render_many(polygons, PolygonView, "polygon.json")}
  end

  def render("show.json", %{polygon: polygon}) do
    %{data: render_one(polygon, PolygonView, "polygon.json")}
  end

  def render("polygon.json", %{polygon: polygon}) do
    %{
      properties: %{id: polygon.id},
      geometry: %{type: :Polygon, coordinates: polygon.coordinates},
      type: :Feature
    }
  end
end
