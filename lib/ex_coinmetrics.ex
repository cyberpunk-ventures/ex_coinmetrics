defmodule ExCoinmetrics do
  use Tesla

  @moduledoc """
  ExCoinmetrics main module for Coinmetrics API
  """

  @doc """
  Get supported assets

  ## Examples

      iex> {:ok, tesla_env} = ExCoinmetrics.get_supported_assets()
      iex> "btc" in tesla_env.body
      true

  """
  plug Tesla.Middleware.BaseUrl, "https://coinmetrics.io/api/v1"
  plug Tesla.Middleware.JSON

  def get_supported_assets() do
    get("/get_supported_assets")
  end
end
