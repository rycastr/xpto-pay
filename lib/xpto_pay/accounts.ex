defmodule XptoPay.Accounts do
  @moduledoc """
  The public interface for the Accounts context.
  """

  alias XptoPay.Accounts.Aggregates.Account
  alias XptoPay.Accounts.Commands.RegisterAccount

  alias XptoPay.Commanded

  @doc """
  Register a new account
  """
  def register(attrs) do
    register_account =
      attrs
      |> Map.put_new(:uuid, UUID.uuid4())
      |> RegisterAccount.build()
      |> RegisterAccount.hash_password()

    with :ok <- Commanded.dispatch(register_account) do
      %Account{
        uuid: register_account.uuid,
        email: register_account.email,
        username: register_account.username,
        password_hash: register_account.password_hash
      }
    end
  end
end
