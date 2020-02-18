{-# LANGUAGE Strict #-}

-- Abstract Syntax Tree
data Cmp = CmpEqual
         | CmpGT
         | CmpLT
         | CmpGTE
         | CmpLTE
  deriving (Eq, Ord, Show)

data R2Expr = IntE Int
            | VarE String
            | PlusE R2Expr R2Expr
            | LetE String R2Expr R2Expr
            | TrueE
            | FalseE
            | AndE R2Expr R2Expr
            | OrE R2Expr R2Expr
            | NotE R2Expr
            | CmpE Cmp R2Expr R2Expr
            | IfE R2Expr R2Expr R2Expr
  deriving (Eq, Ord, Show)


type Variable = String
type Env = [(Variable, Val)]
data Val = IntVal Int | BoolVal Bool
  deriving (Eq, Ord, Show)

eval :: R2Expr -> Env -> Val
eval e env = case e of
  IntE i -> IntVal i
  VarE x -> case lookup x env of
    Just i -> i
    Nothing -> error $ "Failed to find variable " ++ (show x) ++ " in environment " ++ (show env)
  PlusE e1 e2 ->
    let IntVal v1 = eval e1 env
        IntVal v2 = eval e2 env
    in IntVal (v1 + v2)

  LetE x e1 e2 ->
    let v1 = eval e1 env
        env' = (x, v1) : env in
      eval e2 env'
      
  CmpE CmpEqual e1 e2 ->
    let IntVal v1 = eval e1 env
        IntVal v2 = eval e2 env
    in BoolVal (v1 == v2)

  IfE e1 e2 e3 ->
    case eval e1 env of
      BoolVal True -> eval e2 env
      BoolVal False -> eval e3 env
    

data Type = IntT | BoolT
  deriving (Eq, Ord, Show)

type TEnv = [(Variable, Type)]

typeCheck :: R2Expr -> TEnv -> Type
typeCheck e env = case e of
  IntE i -> IntT
  VarE x -> case (lookup x env) of
    Nothing -> error "fail"
    Just t -> t
  TrueE -> BoolT
  FalseE -> BoolT

  CmpE CmpEqual e1 e2 ->
    let t1 = typeCheck e1 env
        t2 = typeCheck e2 env
    in case (t1, t2) of
      (IntT, IntT) -> BoolT
      (BoolT, BoolT) -> BoolT

  IfE e1 e2 e3 ->
    let t1 = typeCheck e1 env
        t2 = typeCheck e2 env
        t3 = typeCheck e3 env
    in case (t1, t2, t3) of
      (BoolT, IntT, IntT) -> IntT
      (BoolT, BoolT, BoolT) -> BoolT
  
  PlusE e1 e2 ->
    let t1 = typeCheck e1 env
        t2 = typeCheck e2 env
    in case (t1, t2) of
      (IntT, IntT) -> IntT
      (_, _) -> error ("Type Error: " ++ (show e))
  LetE x e1 e2 ->
    let t1 = typeCheck e1 env
        newB = (x, t1)
        newEnv = newB : env
    in typeCheck e2 newEnv
  _ -> error (show e)
