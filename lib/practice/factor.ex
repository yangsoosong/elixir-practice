defmodule Practice.Factor do
  def factor(x) do
    factor(x, ceil(:math.sqrt(x)), [])
  end

  def factor(x, a, acc) when a > 1 do
    IO.puts("a#{x},#{a},#{inspect(acc)}")
    if rem(x, a) == 0 do
      factor(div(x, a), a, acc ++ [a])
    else
     factor(x, a-1, acc) 
    end
  end

  def factor(x, a, acc) when a == 1 do
    if x > 1 do
      acc ++ [x]
    end
    IO.puts("b#{x},#{a},#{inspect(acc)}")
    acc
  end

end

# compare up to square root of the number
