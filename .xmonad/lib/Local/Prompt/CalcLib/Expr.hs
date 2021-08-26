module Local.Prompt.CalcLib.Expr where

data Expr
  = Add Expr Expr
  | Sub Expr Expr
  | Mul Expr Expr
  | Div Expr Expr
  | Pow Expr Expr
  | Sqrt Expr
  | Cos Expr
  | Sin Expr
  | Tan Expr
  | ACos Expr
  | ASin Expr
  | ATan Expr
  | Par Expr
  | Lit Double

instance Show Expr where
  show (Add el er) = (show el) ++ " + " ++ (show er)
  show (Sub el er) = (show el) ++ " - " ++ (show er)
  show (Mul el er) = (show el) ++ " x " ++ (show er)
  show (Div el er) = (show el) ++ " / " ++ (show er)
  show (Pow e p) = (show e) ++ "^(" ++ (show p) ++ ")"
  show (Sqrt e) = "sqrt(" ++ (show e) ++ ")"
  show (Cos e) = "cos(" ++ (show e) ++ ")"
  show (Sin e) = "sin(" ++ (show e) ++ ")"
  show (Tan e) = "tan(" ++ (show e) ++ ")"
  show (ACos e) = "acos(" ++ (show e) ++ ")"
  show (ASin e) = "asin(" ++ (show e) ++ ")"
  show (ATan e) = "atan(" ++ (show e) ++ ")"
  show (Par e) = "(" ++ show e ++ ")"
  show (Lit a) = show a

evalExpr :: Expr -> Double
evalExpr (Add el er) = (evalExpr el) + (evalExpr er)
evalExpr (Sub el er) = (evalExpr el) - (evalExpr er)
evalExpr (Mul el er) = (evalExpr el) * (evalExpr er)
evalExpr (Div el er) = (evalExpr el) / (evalExpr er)
evalExpr (Pow e p) = (evalExpr e) ** (evalExpr p)
evalExpr (Sqrt e) = sqrt (evalExpr e)
evalExpr (Cos e) = cos (evalExpr e)
evalExpr (Sin e) = sin (evalExpr e)
evalExpr (Tan e) = tan (evalExpr e)
evalExpr (ACos e) = acos (evalExpr e)
evalExpr (ASin e) = asin (evalExpr e)
evalExpr (ATan e) = atan (evalExpr e)
evalExpr (Par e) = evalExpr e
evalExpr (Lit l) = l
