defmodule PhoenixTodo.Todo do
  use PhoenixTodo.Web, :model

  @derive {Poison.Encoder, only: [:title, :content]}

  schema "todos" do
    field :title, :string
    field :content, :string

    belongs_to :user, PhoenixTodo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
