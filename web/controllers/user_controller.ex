defmodule PhoenixTodo.UserController do
  use PhoenixTodo.Web, :controller

  alias PhoenixTodo.User

  def index(conn, _params) do
    json(conn, User |> Repo.all() |> Repo.preload(:todos))
  end

  def show(conn, %{"id" => id}) do
    json(conn, User|> Repo.get(id) |> Repo.preload(:todos))
  end

  def create(conn, data) do
    changeset = User.changeset(%User{}, data)
    case Repo.insert(changeset) do
      {:ok, user} ->
        id = user |> Repo.preload(:todos) |> Map.get(:id)
        conn
        |> put_status(:created)
        |> json(%{ id: id })
      {:error, changset} ->
        conn
        |> put_status(:bad_request)
        |> render_changeset_error(changset)
    end
  end
end
