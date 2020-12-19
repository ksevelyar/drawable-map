defmodule DrawableMapWeb.PolygonController do
  use DrawableMapWeb, :controller

  alias DrawableMap.Geo
  alias DrawableMap.Geo.Polygon

  action_fallback DrawableMapWeb.FallbackController

  def index(conn, _params) do
    polygons = Geo.list_polygons()
    render(conn, "index.json", polygons: polygons)
  end

  def create(conn, %{"polygon" => polygon_params}) do
    with {:ok, %Polygon{} = polygon} <- Geo.create_polygon(polygon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.polygon_path(conn, :show, polygon))
      |> render("show.json", polygon: polygon)
    end
  end

  def show(conn, %{"id" => id}) do
    polygon = Geo.get_polygon!(id)
    render(conn, "show.json", polygon: polygon)
  end

  def update(conn, %{"id" => id, "polygon" => polygon_params}) do
    polygon = Geo.get_polygon!(id)

    with {:ok, %Polygon{} = polygon} <- Geo.update_polygon(polygon, polygon_params) do
      render(conn, "show.json", polygon: polygon)
    end
  end

  def delete(conn, %{"id" => id}) do
    polygon = Geo.get_polygon!(id)

    with {:ok, %Polygon{}} <- Geo.delete_polygon(polygon) do
      send_resp(conn, :no_content, "")
    end
  end
end
