defmodule Lachlan do
  def all_pages(pages) do
    pages
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
  end

  def get_page(pages, key) when is_integer(key) do
    keyname = "key#{key}" |> String.to_atom()

    pages
    |> Map.get(keyname)
  end

  def get_all_pages(pages, per_page) when per_page > 0 do
    start_fn = fn ->
      0
    end

    next_fn = fn num ->
      key = num + 1

      case get_page(pages, key) do
        nil -> {:halt, num}
        row -> {[row], key}
      end
    end

    after_fn = fn acc ->
      acc
    end

    Stream.resource(start_fn, next_fn, after_fn)
    |> Stream.chunk_every(per_page)
  end
end
