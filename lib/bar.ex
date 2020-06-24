defmodule Bar do
  def all_pages(pages) do
    # %{
    #   key1: %{row: 1, content: "one"},
    #   key2: %{row: 2, content: "two"},
    #   key3: %{row: 3, content: "three"},
    #   key4: %{row: 4, content: "four"},
    #   key5: %{row: 5, content: "five"},
    #   key6: %{row: 6, content: "six"},
    #   key7: %{row: 7, content: "seven"},
    #   key8: %{row: 8, content: "eight"},
    #   key9: %{row: 9, content: "nine"},
    #   key10: %{row: 10, content: "ten"},
    #   key11: %{row: 11, content: "eleven"},
    #   key12: %{row: 12, content: "twelve"},
    #   key13: %{row: 13, content: "thirteen"},
    # }
    pages
  end

  def get_all_pages(pages, per_page) when per_page > 0 do
    start_fn = fn -> get_next_pages(pages, 1, [], per_page - 1) end

    next_fn = fn
      {:more, acc} ->
        # the most contrived key ever
        key_num = Enum.at(acc, 0) |> Map.get(:row)
        {[Enum.reverse(acc)], get_next_pages(pages, key_num+1, acc, per_page - 1)}

      {_, acc} ->
        {:halt, acc}
    end

    after_fn = fn acc ->
      acc
    end

    Stream.resource(start_fn, next_fn, after_fn)
  end

  def get_next_pages(map, key, acc, per_page) do
    keyname = String.to_atom("key#{key}")
    case Map.get(map, keyname) do
      %{row: num, content: text} = row ->
        {:more, get_limited_pages(map, key, [], per_page) |> Enum.filter(&!is_nil(&1))}
      _ -> {:done, acc}
    end
  end

  def get_limited_pages(map, key, acc, per_page) when length(acc) <= per_page do
    keyname = String.to_atom("key#{key}")
    new_acc = [Map.get(map, keyname)|acc]
    get_limited_pages(map, key+1, new_acc, per_page)
  end

  def get_limited_pages(_, _, acc, _) do
    acc
  end
end
