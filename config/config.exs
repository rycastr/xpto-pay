import Config

config :xpto_pay, XptoPay.Commanded,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: XptoPay.EventStore
  ]

config :xpto_pay, event_stores: [XptoPay.EventStore]

config :xpto_pay, XptoPay.EventStore,
  serializer: EventStore.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "xpto_pay_eventstore",
  hostname: "localhost"
