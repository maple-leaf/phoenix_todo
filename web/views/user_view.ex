defmodule PhoenixTodo.UserView do
  use PhoenixTodo.Web, :view

  def render("index.json", %{user: user}) do
    %{data: render_many(user, PhoenixTodo.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PhoenixTodo.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      todos: user.todos
    }
  end
end
