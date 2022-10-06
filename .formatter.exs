[
  # import_deps: [:ecto, :phoenix, :surface],
  import_deps: [:phoenix, :surface],
  plugins: [Phoenix.LiveView.HTMLFormatter, Surface.Formatter.Plugin],
  inputs: ["*.{leex,heex,ex,exs,sface}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{leex,heex,ex,exs,sface}"],
  subdirectories: ["priv/*/migrations"]
]
