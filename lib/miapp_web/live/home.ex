defmodule MiappWeb.Live.Home do
  use MiappWeb, :surface_live_view

  @impl true
  def render(assigns) do
    ~F"""
    <div class={"bg-slate-100"}>
      <div class={"text-sky-500"}>
        <h1 class={"text-lg", "font-medium"}>Esta es Mi App</h1>
      </div>
    </div>
    """
  end
end
