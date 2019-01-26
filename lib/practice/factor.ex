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

  def factor(x, a, acc) when x > 1 do
      factor_prime(x, acc) 
      IO.puts("b#{x},#{a},#{inspect(acc)}")
  end

  def factor_prime(x, acc) do       #it's adding avlue to list but not returning acc
    acc ++ [x]                      #make the sub function that adds the x value
    IO.puts("f#{x},#{inspect(acc)}")
  end
 
  def factor(x, a, acc) when a == 1 do
    IO.puts("c#{x},#{a},#{inspect(acc)}")
    acc
  end

end

# compare up to square root of the number
