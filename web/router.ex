defmodule PhoenixTodo.Router do
  use PhoenixTodo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixTodo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/test", TestController, except: [:new, :edit]
  end

   scope "/api", PhoenixTodo do
     pipe_through :api

     resources "/users", UserController, except: [:new, :edit]
   end
end
