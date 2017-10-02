generic
   type Real is digits <>;
   with function Integrando (X: Real) return Real; 
function Integrar (Xi, Xs: Real; N: Positive) return Real;