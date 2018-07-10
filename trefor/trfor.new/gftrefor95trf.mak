##############################
# MAKE FOR TREFOR FROM TRF SOURCE
##############################

SYSTEM= -Dunix
PERF=-DPOINTER
CC=gcc
# debug version
# CCOPT= -D_DEBUG_TRF_ -DDDEBUG
#CCOPT=-DWITH_LOGO

.c.o:
	$(CC) $(CCOPT) $(SYSTEM) $(PERF) -c  $*.c


#sys := $(shell uname)
#ifneq (,$(findstring CYGWIN,$(strip $(sys))))
#   SYSTYPE := "cygwin_f90"
#else
#  SYSTYPE := "ifort"
#  SYSTYPE="pgf"
#  SYSTYPE := "MPA_f95i"
#endif
# SYSTYPE="ifort"
# SYSTYPE := "lf"
SYSTYPE=gfortran
# SYSTYPE="cygwin_ifort"
# SYSTYPE="cygwin_f90"
# SYSTYPE="MPA_f95i"
# SYSTYPE="MPA_f95n"
UnixOrWin = "unix" # default value

########################################
## For Intel fortran
ifeq ($(SYSTYPE),"ifort")
  FC = ifort  # Intel fortran
#   FFLAGS = -c -save -zero -O3 -mcmodel=medium -shared-intel
#   FFLAGS = -c -save -zero -O3 -fp-model precise
#   FFLAGS = -c -save -zero -O3 -fp-model strict -CB -g -traceback # -- for debug
#   FFLAGS = -c -save -zero -fpe0 -no-ftz  -check bounds -g -traceback # -- for debug
#   FFLAGS = -c -save -zero -O3 -fp-model strict
#   FFLAGS = -c -O3 -save -zero -tpp7   -ip # -xW # -- optimize for Pentium
#   FFLAGS =   -c -save -static -zero -O2 -fpe0 -traceback # -CB -traceback
  FFLAGS_FIX = -c -132 -save -zero -intconstant -O3
#  FFLAGS_FIX = -c -save -zero -intconstant -O3
#   FFLAGS_FIX = -c -132 -save -zero -CB -g -traceback -debug # inline-debug-info # -- for debug
  FFLAGS := -free
  FFLAGS := $(FFLAGS_FIX) $(FFLAGS)
#define
  FFLAGS := $(FFLAGS) -D__INTEL

#  FFLAGS = -c -save -zero -fpe0 -no-ftz  -check bounds -g -traceback # -- for debug
#  FFLAGS = -c -save -zero -check bounds -g -inline_debug_info -traceback # -- for debug
  #FFLAGS = -c -O3 -save -zero -tpp7   -ip # -xW # -- optimize for Pentium
  #FFLAGS =   -c -save -static -zero -O2 -fpe0 -traceback # -CB -traceback
  LDFLAGS = -i-dynamic
#  LDFLAGS = -mcmodel=medium -shared-intel # for 64b
#  FFLAGS = -c -save -fpe0 -g -CB -traceback -inline_debug_info  -DD
  UnixOrWin := "unix"
endif

########################################
## For Windows Intel fortran
ifeq ($(SYSTYPE),cygwin_ifort)
  FC = ifl  # Intel fortran
  FFLAGS = -c -save -zero  -tpp7   -ip  -static -fast
#  FFLAGS = -c -O3 -save -zero -tpp7   -ip
#  FFLAGS = -compile_only -static   -architecture:k7 -optimize:5 -fast -tune:k7 # for optimization Pentium
#  FFLAGS = -c -static -debug:full -check:bounds,power,overflow -traceback -list -show:all
  LDFLAGS =
#  LDFLAGS = /libs:static
  LIBS = ..\\lib\\liblnag.a	..\\lib\\libspars.a
  LIBDIRSYS = /I"/cygdrive/c/Program Files/Intel/Compiler70/IA32/Lib/"
#  LIBDIRSYS = /I"/cygdrive/c/Program Files/Intel/Compiler70/IA32/Lib/"
  UnixOrWin := "win"
endif

########################################
## For Visual Compaq Fortran
ifeq ($(SYSTYPE),cygwin_f90)
  FC = f90  # Compaq fortran
  LINK = link.exe
  # FFLAGS = -compile_only -static  -fast -tune:k7
  LDFLAGS = -architecture:k7 -optimize:5 -fast -tune:k7 # /ignore:505
  FFLAGS = -compile_only -static   -architecture:k7 -optimize:5 -fast -tune:k7 # for optimization Pentium
#  FFLAGS = -c -static -debug:full -check:bounds,power,overflow -traceback -list -show:all
  LIBDIRSYS =
#  LIBDIRSYS = /libpath:"c:\\Program Files\\Microsoft Visual Studio\\DF98\\LIB\\" /libpath:"c:\\Program Files\\Microsoft Visual Studio\\VC98\\LIB\\"
#  LIBDIRSYS = "c:/Program Files/Microsoft Visual Studio/DF98/LIB/"
  UnixOrWin := "win"
endif

########################################
## For Intel fortran
ifeq ($(SYSTYPE),MPA_f95i)
  FC = f95i  # Intel fortran
  FFLAGS = -c -static -save -zero -fpe0  -check bounds -g -traceback # -- for debug
  FFLAGS = -c -O3 -save -zero -tpp7   -ip # -xW # -- optimize for Pentium
  LIBS= $(HOMEStella)/lib/libsparse.a $(HOMEStella)/lib/liblnag.a
  LDFLAGS =
  UnixOrWin := "unix"
endif

########################################
## For NAG fortran
ifeq ($(SYSTYPE),MPA_f95n)
  FC = f95n  # NAG fortran
  FFLAGS = -c  -save
  FFLAGS = -c -O3 -save -f77
  LDFLAGS =
  UnixOrWin := "unix"
endif

########################################
## For Portland Group fortran
ifeq ($(SYSTYPE),pgf)
  FC = pgf95  # pgf fortran
  FFLAGS = -c -fast -Minform,warn -Msave
#  FFLAGS = -c -C -g -Ktrap=fp -Mbounds -Minform,warn -Msave
  LIBS= $(HOMEStella)/lib/libsparse.a $(HOMEStella)/lib/liblnag.a
  UnixOrWin := "unix"
endif

########################################
## For Lahey-Fujutsu fortran
ifeq ($(SYSTYPE),"lf")
  FC = lf95  # Lahey-fujutsu fortran
#  FFLAGS = -c  -sav -g  --trap  --ap   --chkglobal   --pca # debug
  FFLAGS_FIX = -c --sav
#   FFLAGS_FIX = -c -132 -save -zero -CB -g -traceback -debug # inline-debug-info # -- for debug
  FFLAGS := --nfix
  FFLAGS := $(FFLAGS_FIX) $(FFLAGS)

# -sav --ap --tp4 --sse2 --zfm --o2
# --tp4 --sse2 --zfm --o2
# -x name.f  for inlining code name.f
#  FFLAGS = -c  -sav --ap -O --ml cdecl
#  FFLAGS = -c  -sav --trap  --tpp   --o2   --ntrace   --f95   --info
#  FFLAGS = -c  -sav  --tpp   --o2   --ntrace   --f95   --info
  UnixOrWin := "unix"
endif

########################################
## For g77 fortran
ifeq ($(SYSTYPE),g77)
  FC = g77  # g77 fortran
  FFLAGS = -c -g -fbounds-check -finit-local-zero -fno-automatic
  FFLAGS = -c -g -finit-local-zero -fno-automatic
  FFLAGS = -c -O2 -finit-local-zero -fno-automatic -Wall
  LDFLAGS =
  UnixOrWin := "unix"
endif
########################################


########################################
## For gfortran fortran
ifeq ($(SYSTYPE),gfortran)
  FC = gfortran
#  FFLAGS_FIX = -c -g -fbounds-check  -fno-automatic
#  FFLAGS_FIX = -c -g  -fno-automatic
  FFLAGS_FIX = -c -O2 -ffixed-line-length-132 -fno-automatic -Wall
  FFLAGS := -free_form
  FFLAGS := $(FFLAGS_FIX) $(FFLAGS)
  LDFLAGS =
  UnixOrWin := "unix"
endif

########################################
## For Windows
ifeq ($(UnixOrWin),"win")
 FFLAGS += -object:$@
 LDFLAGS += /exe:
 slash_l := \\
endif
########################################
## For Linux
ifeq ($(UnixOrWin),"unix")
 LDFLAGS += -o
 slash_l := /
endif
#-------------------------------------------------------
#---
#-------------------------------------------------------

DEL = rm -f

PROGTREFOR = btrefor95
PROGTREFOR := $(subst /,$(slash_l),$(PROGTREFOR))

FILESTREFOR = trfunix95.trf df1unix95.trf dtcdiunx.trf df2unix95.trf
OBJSTREFOR := $(FILESTREFOR:.trf=.o)

PROGTREFHLN = btreforhln
PROGTREFHLN := $(subst /,$(slash_l),$(PROGTREFHLN))

FILESTREFHLN = trfunix95.trf df1unix95.trf dtcdiunx.trf df2hln.trf
OBJSTREFHLN := $(FILESTREFHLN:.trf=.o)

TREFOR = trf

# for ctrf:
TRFFLAGS = -nfs

.IGNORE:

%.o : %.trf
	$(TREFOR) $(TRFFLAGS) $<
	$(FC) $(FFLAGS_FIX)  $(patsubst %.trf,%.f,$<) $(INCL_DIR)
%.o: %.f
	$(FC) $(FFLAGS_FIX) $< $(INCL_DIR)

%.o: %.f90
	$(FC) $(FFLAGS) $< $(INCL_DIR)
%.o: %.F90
	$(FC) $(FFLAGS)  $< $(INCL_DIR)
%.o: %.F
	$(FC) $(FFLAGS)  $<  $(INCL_DIR)

%.mod : %.o
	@if [! -f $@ ]; then \
	rm $< \
	$(MAKE) $< \
	fi


# %.mod :
# 	@if [! -f $@ ]; then \
#           rm $(*F).o; \
#         fi
# 	$(MAKE) $<
#
# %.o : %.f90
# 	$(FC) -c -o $(*F).o $<
#
# %.o : %.F90
# 	$(FC) -c -o $(*F).o $<
#
# %.o : %.F
# 	$(FC) -c -o $(*F).o $<
#

all: help

t95:  t95u.c
	$(CC) $(CCOPT) t95u.c -o t95



trefor95:  $(OBJSTREFOR)
	$(FC) $(LDFLAGS) $(PROGTREFOR) $(OBJSTREFOR)  $(LIBS)

trefhln95:  $(OBJSTREFHLN)
	$(FC) $(LDFLAGS) $(PROGTREFHLN) $(OBJSTREFHLN)  $(LIBS)

help:
	@echo "You can do: "
	@echo " t95           --  compile trf95 wrapper"
	@echo " trefor95      --  compile trefor95 classic"
	@echo " trefhln95     --  compile trefhln95 -- Head line number"
	@echo " clean         --  delete *.o *.f *.mod *.lst"
	@echo " cleanall      --  delete t95 btrefor95 btreforhln"

#
# Here are all the dependencies:
#


trfunix95.o  :     trfunix95.trf trfgunx95.inc trfcode.inc chargen.inc tree.inc
df1unix95.o  :     df1unix95.trf trfgunx95.inc trfcode.inc chargen.inc tree.inc
dtcdiunx.o   :     dtcdiunx.trf trfgunx.inc trfcode.inc chargen.inc
df2unix95.o  :     df2unix95.trf trfgunx95.inc trfcode.inc chargen.inc tree.inc
df2hln.o     :     df2hln.trf trfgunx95.inc trfcode.inc chargen.inc tree.inc

clean:
	$(DEL) *.o
	$(DEL) *.mod *.lst
	$(DEL)  trfunix95.f df1unix95.f dtcdiunx.f df2unix95.f df2hln.f

cleanall: clean
	$(DEL) t95 btrefor95 btreforhln
