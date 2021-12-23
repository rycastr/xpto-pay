defmodule XptoPay.Accounts.Commands.RegisterAccount do
  @moduledoc false

  defstruct [:uuid, :email, :username, :password, :password_hash]

  @doc """
  Build a new RegisterAccount
  """
  def build(%{uuid: uuid, email: email, username: username, password: password}),
    do: %__MODULE__{uuid: uuid, email: email, username: username, password: password}

  @doc """
  Hash the password and clear real password
  """
  def hash_password(%__MODULE__{password: password} = register_account) do
    %__MODULE__{register_account | password: nil, password_hash: "hashed:#{password}"}
  end
end
