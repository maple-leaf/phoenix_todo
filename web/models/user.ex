defmodule PhoenixTodo.User do
  use PhoenixTodo.Web, :model

  @derive {Poison.Encoder, only: [:id, :name, :email, :bio, :todos]}

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :bio, :string

    has_many :todos, PhoenixTodo.Todo

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email, :bio])
    |> validate_length(:name, min: 2, max: 100)
    |> validate_length(:email, min: 10, max: 100)
  end
end
