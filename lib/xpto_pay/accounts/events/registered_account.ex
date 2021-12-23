defmodule XptoPay.Accounts.Events.RegisteredAccount do
  @moduledoc false

  @derive Jason.Encoder

  defstruct [:uuid, :email, :username, :password_hash]
end
