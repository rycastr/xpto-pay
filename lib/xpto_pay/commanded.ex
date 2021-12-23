defmodule XptoPay.Commanded do
  use Commanded.Application, otp_app: :xpto_pay

  router XptoPay.Router
end
