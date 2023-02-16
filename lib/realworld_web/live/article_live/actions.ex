defmodule RealworldWeb.ArticleLive.Actions do
  use Phoenix.Component

  attr :article, Realworld.Articles.Article, required: true
  attr :is_owner, :boolean, required: true
  attr :edit_path, :string, required: true
  attr :profile_path, :string, required: true

  def actions(assigns) do
    ~H"""
    <div class="article-meta">
      <a href={@profile_path}><img src={@article.user.image} /></a>
      <div class="info">
        <a href={@profile_path} class="author">
          <%= @article.user.username %>
        </a>
        <span class="date">
          <%= Calendar.strftime(@article.created_at, "%B %d, %Y") %>
        </span>
      </div>
      <span :if={@is_owner}>
        <a
          class="btn btn-outline-secondary btn-sm"
          href={@edit_path}
        >
          <i class="ion-edit"></i> Edit Article
        </a>
        <button class="btn btn-outline-danger btn-sm" phx-click="delete">
          <i class="ion-trash-a"></i> Delete Article
        </button>
      </span>
      <span :if={!@is_owner}>
        <button class="btn btn-sm btn-outline-secondary" phx-click="follow">
          <i class="ion-plus-round"></i>
          &nbsp; Follow <%= @article.user.username %> <span class="counter">(10)</span>
        </button>
        <button class="btn btn-sm btn-outline-primary" phx-click="favorite">
          <i class="ion-heart"></i> &nbsp; Favorite Post <span class="counter">(29)</span>
        </button>
      </span>
    </div>
    """
  end
end
