defmodule DrawableMap.Geo do
  @moduledoc """
  The Geo context.
  """

  import Ecto.Query, warn: false
  alias DrawableMap.Repo

  alias DrawableMap.Geo.Polygon

  @doc """
  Returns the list of polygons.

  ## Examples

      iex> list_polygons()
      [%Polygon{}, ...]

  """
  def list_polygons do
    Repo.all(Polygon)
  end

  @doc """
  Gets a single polygon.

  Raises `Ecto.NoResultsError` if the Polygon does not exist.

  ## Examples

      iex> get_polygon!(123)
      %Polygon{}

      iex> get_polygon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_polygon!(id), do: Repo.get!(Polygon, id)

  @doc """
  Creates a polygon.

  ## Examples

      iex> create_polygon(%{field: value})
      {:ok, %Polygon{}}

      iex> create_polygon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_polygon(attrs \\ %{}) do
    %Polygon{}
    |> Polygon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a polygon.

  ## Examples

      iex> update_polygon(polygon, %{field: new_value})
      {:ok, %Polygon{}}

      iex> update_polygon(polygon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_polygon(%Polygon{} = polygon, attrs) do
    polygon
    |> Polygon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a polygon.

  ## Examples

      iex> delete_polygon(polygon)
      {:ok, %Polygon{}}

      iex> delete_polygon(polygon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_polygon(%Polygon{} = polygon) do
    Repo.delete(polygon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking polygon changes.

  ## Examples

      iex> change_polygon(polygon)
      %Ecto.Changeset{data: %Polygon{}}

  """
  def change_polygon(%Polygon{} = polygon, attrs \\ %{}) do
    Polygon.changeset(polygon, attrs)
  end
end
