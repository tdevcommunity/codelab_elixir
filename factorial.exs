defmodule Factorial do
  # list = [40000, 40000, 40000, 40000]
  # n! = n * n-1 * n - 2 ... 2 * 1
  defp factorial(num) when num == 1 do
    1
  end

  defp factorial(num) do
    num * factorial(num - 1)
  end

  def non_async(list) do
    start = System.monotonic_time(:millisecond)
    Enum.map(list, &factorial/1)
    stop = System.monotonic_time(:millisecond)
    time = (stop - start) / 1000
    IO.puts("Non async factorial: #{time}")
  end

  def async(list) do
    start = System.monotonic_time(:millisecond)
    async_list = Enum.map(list, fn num ->
      Task.async(fn ->
        factorial(num)
      end)
    end)
    Task.await_many(async_list, 60000)
    stop = System.monotonic_time(:millisecond)
    time = (stop - start) / 1000
    IO.puts("Async factorial: #{time}")
  end
end
