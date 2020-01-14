
-- R0Expr ::= <int> | R0Expr + R0Expr | R0Expr - R0Expr

data R0Expr = IntE Int | PlusE R0Expr R0Expr | SubtractE R0Expr R0Expr
  deriving Show


plus :: Int -> Int -> Int
plus a b = a + b

eval :: R0Expr -> Int
eval e = case e of
  IntE i -> i
  PlusE e1 e2 -> (eval e1) + (eval e2)
  SubtractE e1 e2 -> (eval e1) - (eval e2)

-- parse :: String -> R0Expr
-- parse "5 + 6 + 7" = PlusE (IntE 5) (PlusE (IntE 6) (IntE 7))
