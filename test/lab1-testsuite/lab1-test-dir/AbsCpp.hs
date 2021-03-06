

module AbsCpp where

-- Haskell module generated by the BNF converter




newtype CIdent = CIdent String deriving (Eq, Ord, Show, Read)
data Program = PDefs [Def]
  deriving (Eq, Ord, Show, Read)

data Def
    = DFun Type CIdent [Arg] FBod
    | DType TypeDef
    | DDcl Decl
    | DUs QConst
  deriving (Eq, Ord, Show, Read)

data Arg = ArgVar ArgDecl | ArgCons ArgDecl
  deriving (Eq, Ord, Show, Read)

data ArgDecl
    = ADeclType Type | ADeclVar Type CIdent | ADeclInit Type CIdent Exp
  deriving (Eq, Ord, Show, Read)

data FBod = FBodBlck [Stm] | FBodNil
  deriving (Eq, Ord, Show, Read)

data Stm
    = SExp Exp
    | SDecl Decl
    | SRet Exp
    | SWhile Exp Stm
    | SDoWhile Stm Exp
    | SFor Decl Exp Exp Stm
    | SIf Exp Stm
    | SIfEl Exp Stm Stm
    | SBlock [Stm]
    | STyp TypeDef
  deriving (Eq, Ord, Show, Read)

data Decl = DclVar DeclInit | DclCons DeclInit
  deriving (Eq, Ord, Show, Read)

data DeclInit
    = DclNoInit Type CIdent
    | Dcls Type CIdent [CIdent]
    | DclInit Type CIdent Exp
  deriving (Eq, Ord, Show, Read)

data TypeDef = TDef Type CIdent
  deriving (Eq, Ord, Show, Read)

data Type
    = TBool
    | TInt
    | TChar
    | TDouble
    | TVoid
    | TConst QConst
    | TRef Type
  deriving (Eq, Ord, Show, Read)

data Exp
    = EThr Exp
    | ECond Exp Exp Exp
    | EAss Exp Exp
    | EPEq Exp Exp
    | EMEq Exp Exp
    | EOr Exp Exp
    | EAnd Exp Exp
    | EEq Exp Exp
    | ENEq Exp Exp
    | ELt Exp Exp
    | EGt Exp Exp
    | ELtEq Exp Exp
    | EGtWq Exp Exp
    | ELShift Exp Exp
    | ERShift Exp Exp
    | EAdd Exp Exp
    | ESub Exp Exp
    | EMul Exp Exp
    | EDiv Exp Exp
    | EMod Exp Exp
    | EIncr Exp
    | EDecr Exp
    | ENot Exp
    | EPtr Exp
    | EPIncr Exp
    | EPDecr Exp
    | EDot Exp Exp
    | EArr Exp Exp
    | EFCall Exp [Exp]
    | EInd Exp Exp
    | EQConst QConst
    | EInt Integer
    | EChar Char
    | EDoub Double
    | EStr [String]
  deriving (Eq, Ord, Show, Read)

data QConst = QConstMain [QConstEl]
  deriving (Eq, Ord, Show, Read)

data QConstEl = QConstCIdent CIdent | QConstTp CIdent [Type]
  deriving (Eq, Ord, Show, Read)

