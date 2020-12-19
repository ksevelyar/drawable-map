defmodule DrawableMapWeb.PolygonControllerTest do
  use DrawableMapWeb.ConnCase

  alias DrawableMap.Geo
  alias DrawableMap.Geo.Polygon

  @create_attrs %{
    coordinates: %{}
  }
  @update_attrs %{
    coordinates: %{}
  }
  @invalid_attrs %{coordinates: nil}

  def fixture(:polygon) do
    {:ok, polygon} = Geo.create_polygon(@create_attrs)
    polygon
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all polygons", %{conn: conn} do
      conn = get(conn, Routes.polygon_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create polygon" do
    test "renders polygon when data is valid", %{conn: conn} do
      conn = post(conn, Routes.polygon_path(conn, :create), polygon: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.polygon_path(conn, :show, id))

      assert %{
               "id" => id,
               "coordinates" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.polygon_path(conn, :create), polygon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update polygon" do
    setup [:create_polygon]

    test "renders polygon when data is valid", %{conn: conn, polygon: %Polygon{id: id} = polygon} do
      conn = put(conn, Routes.polygon_path(conn, :update, polygon), polygon: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.polygon_path(conn, :show, id))

      assert %{
               "id" => id,
               "coordinates" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, polygon: polygon} do
      conn = put(conn, Routes.polygon_path(conn, :update, polygon), polygon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete polygon" do
    setup [:create_polygon]

    test "deletes chosen polygon", %{conn: conn, polygon: polygon} do
      conn = delete(conn, Routes.polygon_path(conn, :delete, polygon))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.polygon_path(conn, :show, polygon))
      end
    end
  end

  defp create_polygon(_) do
    polygon = fixture(:polygon)
    %{polygon: polygon}
  end
end
