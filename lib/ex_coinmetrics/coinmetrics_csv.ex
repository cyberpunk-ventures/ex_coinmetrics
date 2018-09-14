defmodule ExCoinmetrics.CSV do
  use Tesla
  alias NimbleCSV.RFC4180, as: NimbleCSV

  @moduledoc """
  ExCoinmetrics main module for Coinmetrics API
  """

  plug Tesla.Middleware.BaseUrl, "https://coinmetrics.io/"
  plug Tesla.Middleware.JSON

  @doc """
  Get supported assets

  ## Examples

      iex> {:ok, tesla_env} = ExCoinmetrics.CSV.asset()
      iex> "btc" in tesla_env.body
      true

  """

  def asset(asset) do
    with {:ok, tesla_env} <- get("/data/#{asset}.csv") do
      # hacky parsing implementation due to CSV module apparently not being able to handle a single line csv string
      body =
        tesla_env.body
        |> NimbleCSV.parse_string(headers: false)
        |> Stream.map(&Enum.join(&1, ","))
        |> CSV.decode!(headers: true)
        |> Enum.to_list()

      tesla_env = Map.put(tesla_env, :body, body)
      {:ok, tesla_env}
    else
      err_tup -> err_tup
    end
  end
end
