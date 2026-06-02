defmodule ElixirBaseWeb.PageController do
  use ElixirBaseWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
