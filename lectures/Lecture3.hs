{-# LANGUAGE Strict, ScopedTypeVariables #-}

import Data.Maybe


-- R0Expr ::= <int> | R0Expr + R0Expr | R0Expr - R0Expr


-- let x = 5 in x + 6
-- -> LetE "x" (IntE 5)
--      (PlusE (VarE "x") (IntE 6))


plus :: Int -> Int -> Int
plus a b = a + b

data R0Expr = IntE Int | PlusE R0Expr R0Expr | SubtractE R0Expr R0Expr
            | VarE String | LetE String R0Expr R0Expr
  deriving Show

type Env = [(String, Int)]

--data Maybe = Nothing | Just a

eval :: R0Expr -> Env -> Int
eval e env = case e of
  VarE x ->
    let result :: Maybe Int = lookup x env
    in case result of
      Nothing -> error ("Failed to find variable " ++ x ++ " in environment " ++ (show env))
      Just i -> i
  IntE i -> i
  PlusE e1 e2 -> (eval e1 env) + (eval e2 env)
  SubtractE e1 e2 -> (eval e1 env) - (eval e2 env)
  LetE x e1 e2 ->
    let v1   :: Int = eval e1 env
        env' :: Env = (x, v1) : env
        v2   :: Int = eval e2 env
    in v2
        

-- parse :: String -> R0Expr
-- parse "5 + 6 + 7" = PlusE (IntE 5) (PlusE (IntE 6) (IntE 7))

test1 = LetE "x" (PlusE (IntE 5) (IntE 6)) (PlusE (VarE "x") (IntE 10))

