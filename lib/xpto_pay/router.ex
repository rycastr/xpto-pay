defmodule XptoPay.Router do
  use Commanded.Commands.Router

  alias XptoPay.Accounts.Aggregates.Account

  alias XptoPay.Accounts.Commands.RegisterAccount

  dispatch [RegisterAccount], to: Account, identity: :uuid
end
