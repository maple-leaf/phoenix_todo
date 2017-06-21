defmodule PhoenixTodo.Repo.Migrations.InitTodoTable do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :content, :text

      timestamps()
    end
  end
end
