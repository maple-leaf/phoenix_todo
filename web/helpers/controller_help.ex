defmodule PhoenixTodo.Controller.Helpers do
  import Plug.Conn
  import Phoenix.Controller

  def render_changeset_error(conn, changeset) do
    error = Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
    conn
    |> put_status(:bad_request)
    |> json(error)
  end
end
