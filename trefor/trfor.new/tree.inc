 @CHARACTER TEXT(@Ntextmax);
 -- The following 9 arrays form the structure of variable NODES:
 INTEGER*2 LIND(@Lindmax),-- Local indeces of nodes
           Plind(@Nodemax),-- Local index pointer
           ASON(@Nodemax),-- Address of Son nodes
           NOFSON(@Nodemax),-- Number of Son nodes
           HEADLN(@Nodemax),-- Number of Tree line where node head is kept
           ALSPRE(@Nodemax);-- alias predecessor in given node
/* CHARACTER*1 Tnode(@Nodemax)/@Nodemax*'-'/,  -- If '+' then
        -- Trace of nodes needed
    Opcon(@Nodemax);  -- ^Trefor regime: operator continues */
 @Integer ATEXT(@Nodemax);  -- Addresses of Node texts
 Integer*4 RETCOD,NUMERR,Llab,CLIND,Ndef;
 COMMON/TREE/ATEXT,LIND,Plind,ASON,NOFSON,HEADLN,ALSPRE,TEXT;
 COMMON/RC/RETCOD,NUMERR,LST,NBYTE,NODTOT,CLIND;
 --? array UP to common because it used also in DF2PC now
INTEGER*2 UP(256)/
  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
 90, 91, 92, 93, 94, 95, 96, 65, 66, 67, 68, 69, 70, 71, 72,
 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87,
 88, 89, 90,123,124,125,126,127,128,129,130,131,132,133,134,
135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,
150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,
165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,
195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,
210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,
225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,
255/;
 Common/Label/Llab,Ndef;
 Integer*2 Alpred, -- alias predecessor
           Alsprc, -- current alias predecessor
           Calias, -- current free position in ALIAS NAMES
           Palias; -- pointer to beginning of i-th alias name
 @CHARACTER Nalias; -- NAMES of aliases
 @Integer Talbeg, -- pointer to beginning of i-th alias def. in TEXT
          Talfin; -- pointer to next position after end
                  --  i-th alias def. in TEXT
 Common/Tabals/Talbeg(@Ndefmax),Talfin(@Ndefmax),
               Palias(@Ndefmax),Nalias(@Ldefmax),Alpred(@Ndefmax);
 Integer*2 Nc1st,  -- first call of procedure
           Nextc,  -- next call of procedure
           Retlab; -- buffer for return labels
 Common/Taproc/Nc1st(@procmax),Nextc(@callmax),Retlab(@callmax);
 @CHARACTER Retrt(6)/'I','6','R',' ',' ',' '/;
