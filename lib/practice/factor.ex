defmodule Practice.Factor do
  def factor(x) do
    #factor(x, ceil(:math.sqrt(x)), [])
    factor(x, 2, [])
  end

  # def factor(x, a, acc) when a > 1 do
  # IO.puts("a#{x},#{a},#{inspect(acc)}")
    #   if rem(x, a) == 0 do                    #&& a is prime do
  # if rem(x, a) == 0 do
  # IO.puts("l#{x},#{a},#{inspect(acc)}")
 
  #     factor(div(x, a), a, acc ++ [a])
  #  else
  #   factor(x, a-1, acc) 
  # end
  #end

  def factor(x, a, acc) do                # much easier to do with increment.. :@
    if x > a do
      if rem(x, a) == 0 do
        factor(div(x, a), 2, acc ++ [a])
      else 
        factor(x, a+1, acc)
      end
    else if x == a do
      acc ++ [a]
    end
    end
  end
   

  #  def factor(x, a, acc) when x > 1 do
  #   factor_prime(x, acc) 
  #   IO.puts("b#{x},#{a},#{inspect(acc)}")
  # end

  #def factor_prime(x, acc) do       #it's adding avlue to list but not returning acc
  # acc = acc ++ [x]                      #make the sub function that adds the x value
  # IO.puts("f#{x},#{inspect(acc)}")
  #end
 
  #  def factor(x, 1, acc) do 
  # if length(acc) == 0 do
  # IO.puts("c#{x},#{inspect(acc)}")
  #    (acc ++ [x])
  #  else
  #    (acc)
  #  end
  # end

  #  def non_prime_list(acc) do
  # Enum.filter(acc, fn x -> is_prime(x) end)
  #end

  #def is_prime(a) do
  #      IO.puts("ip#{a}")
 
  #  length(factor(a)) == 1

  #end

  #def is_prime_helper(acc) do
  #  length(acc) == 1
  #end

end

# compare up to square root of the number
