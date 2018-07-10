   _Define
       @S_Blank      Tsym(1)
       @S_Minus      Tsym(2)
       @Percent      Tsym(3)
       @Colon        Tsym(4)
       @Equal        Tsym(5)
       @Underline    Tsym(6)
       @Apostrophe   Tsym(7)
       @S_Semicol    Tsym(8)
       @S_Dollar     Tsym(9)
       @S_Aster      Tsym(10)
       @Alias        Tsym(11)
       @Slash        Tsym(12)
       @S_Exclam     Tsym(13)
       @Ampersand    Tsym(14)
       @S_GT         Tsym(15)
       @S_LT         Tsym(16)
       @S_NE         Tsym(17)
       @Zero         Tsym(18)
       @S_L_Br       Tsym(19)
       @S_R_Br       Tsym(20)
       @Point        Tsym(21)
       @S_Plus       Tsym(22)
       @Comma        Tsym(23)
       @Nine         Tsym(24)
       @Question     Tsym(25)
       @S_Quote      Tsym(26)
       @S_C          Tsym(27)
       @S_Number     Tsym(28)
       @S_H_CAP      Tsym(29)
       @S_h          Tsym(30)
       @0            Dig0
       @9            Dig9
       @Dt           Colon   --  Code of :
       @Kt           0  -- End_of_Text
       @Ky           1  --  End_of_Node
       @Tr           2  --  Request
       @Define       3
       @Calias       4  --  Code of Alias
       @Gt           5  --  >
       @Lt           6  --  <
       @Ge           7  --  >=
       @Le           8  --  <=
       @Ne           9  --  ^=
       @Eq          10  --  ==
       @And         11  --  &
       @Or          12  --  !
       @Not         13  --  ^
       @Cr          13  --  Carriage Return - совпадает с @Not ?
       @Ko          35  --  End_of_Operator
       @Attention   14  --  Attention
       @Bcm         41  --  Begin of comment
       @Ecm         42  --  End   of comment
       @Bacm        43  --  Begin of Ada comment
       @Er          55  --  Error
       @L_Bracket   66  --  [
       @R_Bracket   67  --  ]
       ;
 -- _Include chargen; -- bad place, already called !!!
@Character Tsym(30)/' ','-','%',':','=','_','''',';','$','*','@',
 '/','!','&','>','<','^','0','[',']','.','+',',','9','?','"','C','#',
 'H','h'/;
