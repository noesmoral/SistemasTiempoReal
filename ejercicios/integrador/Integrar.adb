function Integrar (Xi, Xs: Real; N: Positive) return Real is
   Resultado: Real := 0.0;
   Delta_X: constant Real := (Xs - Xi) / Real (N);
   X: Real := Xi;
begin
   for J in 1..N loop
      Resultado := Resultado + Integrando(X)*Delta_X;
      X := X + Delta_X;
   end loop;
   return Resultado;
end Integrar;