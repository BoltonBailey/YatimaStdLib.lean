class Ring (R : Type) extends Add R, Mul R, Sub R, OfNat R (nat_lit 0), OfNat R (nat_lit 1), HPow R Nat R, BEq R

namespace Ring

def fromNat [Ring R] (n : Nat) : R :=
  match n with
    | 0 => 0
    | k + 1 => fromNat k + 1

instance [Ring R] : Coe Nat R where
  coe := fromNat

instance [Ring R] : OfNat R n where
  ofNat := Coe.coe n

instance [Ring R] : Inhabited R where
  default := 0

instance : Ring Nat where

instance : Ring Int where

end Ring

class Field (K : Type) extends Ring K where
  inv : K → K
  sqrt : K → Option K

namespace Field

instance [Field K] : Div K where
  div a b := a * Field.inv b

end Field