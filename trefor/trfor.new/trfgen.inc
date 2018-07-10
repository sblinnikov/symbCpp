--File/TRFGEN INCLUDE Z1/Size: 22/Print Date:22/12/89/Time:17:49:49
-----------------------------------------------------------------
  _Define
   @Ntextmax    32757 --     Length of array TEXT( for integer*2 )
   @Ntextmax    65535 --     Length of array TEXT integer*4
   @Ntextmax    900000 --     Length of array TEXT integer*4
   @Nodemax     512   --     Maximum number of Nodes
   @Lindmax     2048  --     Maximum number of loc. index buffer
   @Ndefmax     300   --     Upper count for alias names
   @Ldefmax     3000  --     Buffer for alias names
   @Ndomax      64    --     N of embedded Do-constructions
   @Ncasemax    20    --     N of embedded Case-constructions
   @Nstatemax   128   --     N of embedded States for DTCF2
   @Nsw         36    --     N of Intrinsic Trefor service words
   @Lenmax      16    --     Maximum length of a service word
   @Swmax       64    --     Maximum N of all service words
   @Lc          132   --     Trefor truncating position
   @LcOut       132   --     Output truncating position
   @Nclass      20    --     Lexic classes for DTCF1
   @Maxlevel     5    --     Highest include level
   @Ndef0        1   --
   @Stnode       50    --     Maximum depth of NODES STACK
   @Stals        20    --     Maximum depth of ALIAS STACK
   @EqByte       1    --     loc. of literal byte in logical eq.
   @Procmax     32    --     Maximum number of procedures
   @Callmax     256   --     Maximum number of procedure calls
   @S_CONTINUATION  "' '" ; -- Symbol continuation for PASCAL etc...
