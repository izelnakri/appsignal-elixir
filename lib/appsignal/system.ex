defmodule Appsignal.SystemBehaviour do
end

defmodule Appsignal.System do
  @behaviour Appsignal.SystemBehaviour

  def heroku? do
    System.get_env("DYNO") != nil
  end
end
