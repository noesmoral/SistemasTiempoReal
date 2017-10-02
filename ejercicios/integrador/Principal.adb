with Ada.Text_Io, Ada.Numerics.Elementary_Functions,
     Integrar;
use  Ada.Text_Io, Ada.Numerics.Elementary_Functions;

procedure Principal is
   package Float_Es is new Float_Io (Float);
   use Float_Es;
   
   function G (X: Float) return Float is
   --
   --           2
   --         -t /2
   -- f(x) = e
   --
      function F (T: Float) return Float is
      begin
         return Exp (-T*T/2.0);
      end F;
   
      function Integrar_F is new Integrar (Integrando => F,
                                           Real => Float);
   begin -- G
      return Integrar_F (0.0, X, Positive(X)*1000) /
             Sqrt (2.0*Ada.Numerics.Pi);
   end G;
   
begin --  Principal
   Put ("G (oo)   = ");
   Put (G (1000.0),
        Fore => 4, Aft => 5, Exp => 0); -- G(oo) = 1/2;
                                        -- "    0.50019"
                                        --   FORE.AFT e EXP
   New_Line;
end Principal;