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
        user = User.changeset(%User{}, data)
        {:ok, u} = Repo.insert(user)
        u1 = u |> Repo.preload(:todos)
        json conn, %{ id: u1 |> Map.get(:id) }
        #json conn, u1
    end
end
