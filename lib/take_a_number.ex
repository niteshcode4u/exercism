defmodule TakeANumber do
  @spec start :: pid
  def start, do: spawn(fn -> run(0) end)

  defp run(number) do
    receive do
      {:take_a_number, sender_pid} ->
        send(sender_pid, number + 1)
        run(number + 1)

      {:report_state, sender_pid} ->
        send(sender_pid, number)
        run(number)

      :stop ->
        :ok

      _non_matching ->
        run(number)
    end
  end
end
