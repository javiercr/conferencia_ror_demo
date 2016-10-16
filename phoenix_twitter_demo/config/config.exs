# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twitter_demo,
  ecto_repos: [TwitterDemo.Repo]

# Configures the endpoint
config :twitter_demo, TwitterDemo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R2bQFPym9YkEOgMm9WPUfUjGW5KcJTCPnQPZhYNoUqS8Y4NgvOmdQy70IzTtUxlM",
  render_errors: [view: TwitterDemo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TwitterDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
