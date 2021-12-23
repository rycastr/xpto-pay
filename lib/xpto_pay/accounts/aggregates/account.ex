defmodule XptoPay.Accounts.Aggregates.Account do
  @moduledoc false

  defstruct [:uuid, :email, :username, :password_hash]

  alias XptoPay.Accounts.Commands.RegisterAccount
  alias XptoPay.Accounts.Events.RegisteredAccount

  @doc """
  Execute the command and emit a event
  """
  def execute(%__MODULE__{uuid: nil}, %RegisterAccount{} = command) do
    %RegisteredAccount{
      uuid: command.uuid,
      email: command.email,
      username: command.username,
      password_hash: command.password_hash
    }
  end

  @doc """
  Apply the event in aggregade
  """
  def apply(%__MODULE__{} = account, %RegisteredAccount{} = event) do
    %__MODULE__{
      account
      | uuid: event.uuid,
        email: event.email,
        username: event.username,
        password_hash: event.password_hash
    }
  end
end
