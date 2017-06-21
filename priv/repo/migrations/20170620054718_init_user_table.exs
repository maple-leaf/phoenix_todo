defmodule PhoenixTodo.Repo.Migrations.InitUserTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :bio, :string

      timestamps()
    end
  end
end
