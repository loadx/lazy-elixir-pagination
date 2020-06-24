random_string = fn ->
  Enum.map(1..Enum.random(1..10), fn _ -> Enum.random(33..124) end)
end

random_map = fn n ->
  Enum.map(1..Enum.random(1..n), fn x ->
    {"key#{x}", %{row: x, content: random_string.()}}
  end) |> Map.new()
end

Benchee.run(
  %{
    "Mat" => fn x ->
      Enum.map(1..10, fn n ->
        Mat.get_all_pages(x, n) |> Enum.to_list()
      end)
    end,

    "Lachlan" => fn x ->
      Enum.map(1..10, fn n ->
        Lachlan.get_all_pages(x, n) |> Enum.to_list()
      end)
    end,
  },
  time: 10,
  memory_time: 2,
  inputs: %{
    "small" => random_map.(10),
    "medium" => random_map.(100),
    "large" => random_map.(1000),
    "supersize" => random_map.(10_000)
  }
)
