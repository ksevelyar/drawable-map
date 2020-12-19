defmodule DrawableMap.GeoTest do
  use DrawableMap.DataCase

  alias DrawableMap.Geo

  describe "polygons" do
    alias DrawableMap.Geo.Polygon

    @valid_attrs %{coordinates: %{}}
    @update_attrs %{coordinates: %{}}
    @invalid_attrs %{coordinates: nil}

    def polygon_fixture(attrs \\ %{}) do
      {:ok, polygon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_polygon()

      polygon
    end

    test "list_polygons/0 returns all polygons" do
      polygon = polygon_fixture()
      assert Geo.list_polygons() == [polygon]
    end

    test "get_polygon!/1 returns the polygon with given id" do
      polygon = polygon_fixture()
      assert Geo.get_polygon!(polygon.id) == polygon
    end

    test "create_polygon/1 with valid data creates a polygon" do
      assert {:ok, %Polygon{} = polygon} = Geo.create_polygon(@valid_attrs)
      assert polygon.coordinates == %{}
    end

    test "create_polygon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_polygon(@invalid_attrs)
    end

    test "update_polygon/2 with valid data updates the polygon" do
      polygon = polygon_fixture()
      assert {:ok, %Polygon{} = polygon} = Geo.update_polygon(polygon, @update_attrs)
      assert polygon.coordinates == %{}
    end

    test "update_polygon/2 with invalid data returns error changeset" do
      polygon = polygon_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_polygon(polygon, @invalid_attrs)
      assert polygon == Geo.get_polygon!(polygon.id)
    end

    test "delete_polygon/1 deletes the polygon" do
      polygon = polygon_fixture()
      assert {:ok, %Polygon{}} = Geo.delete_polygon(polygon)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_polygon!(polygon.id) end
    end

    test "change_polygon/1 returns a polygon changeset" do
      polygon = polygon_fixture()
      assert %Ecto.Changeset{} = Geo.change_polygon(polygon)
    end
  end
end
