defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |> String.split(~r/\s+/)
    |> tag_tokens
    |> multidiv
    |> sumsubtract
    |> calculate

    # pipeline
    # call the functions, nultipy
    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end

  def tag_tokens(list) do
    Enum.map(list, fn x -> tag_token(x) end)
  end

  def tag_token(x) do
    if Enum.member?(["*", "/", "+", "-"], x ) do
      {:op, x}
    else
      {:num, parse_float(x)}
    end
  end


  def multidiv([{:num, num1}, {:op, "*"}, {:num, num2} | rest]) do
    #[{:num, (num1 * num2)}] ++ multidiv(rest)
    multidiv([{:num, (num1 * num2)}] ++ rest)
  end

  def multidiv([{:num, num1}, {:op, "/"}, {:num, num2} | rest]) do
    #[{:num, (num1 / num2)}] ++ multidiv(rest)
    multidiv([{:num, (num1 / num2)}] ++ rest)
  end
  
  def multidiv([first | rest]) do       #check if there is remained numbers
    [first] ++ multidiv(rest)
  end
  
  def multidiv([]) do                    #check if the array is empty
    []
  end


  def sumsubtract([{:num, num1}, {:op, "+"}, {:num, num2} | rest]) do
    #[{:num, (num1 + num2)}] ++ multidiv(rest)
    sumsubtract([{:num, (num1 + num2)}] ++ rest)
  end

  def sumsubtract([{:num, num1}, {:op, "-"}, {:num, num2} | rest]) do
    #[{:num, (num1 - num2)}] ++ multidiv(rest)    
    sumsubtract([{:num, (num1 - num2)}] ++ rest)
  end
  
  def sumsubtract([first | rest]) do
    [first] ++ sumsubtract(rest)
  end
  
  def sumsubtract([]) do
    []
  end


  def calculate(numinarray) do
    numinarray[:num]
  end




end
