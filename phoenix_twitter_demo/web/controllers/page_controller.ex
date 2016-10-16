# /web/controllers/page_controller.ex

defmodule TwitterDemo.PageController do
  use TwitterDemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def timeline(conn, params) do
    conn
    |> assign(:nickname, params["nickname"])
    |> render("timeline.html")
  end
end
