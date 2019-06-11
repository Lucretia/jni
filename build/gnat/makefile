TOP			=	../..
SRC			=	$(TOP)/src
DOC_SRC		=	$(TOP)/doc

JNI_MODE	=	debug
JNI_BUILD	=	linux

GEN			=	gen
DOC_GEN		=	$(GEN)/doc

DESTDIR		?=	/opt

GPRBUILD	=	gprbuild
GPRINSTALL	=	gprinstall
GPRCLEAN	=	gprclean
INSTALL		=	install
CAT			=	cat

LIB_NAME	=	gen/$(JNI_MODE)/libjni-ada.a

TESTS_SRCS	=	../../tests/test.adb

########################################################################################################################

.PHONY: jni.gpr test.gpr

all: $(LIB_NAME) tests

$(LIB_NAME): jni.gpr

# Add lib targets here.
jni.gpr:
	$(GPRBUILD) -p -XJNI_MODE=$(JNI_MODE) -XJNI_BUILD=$(JNI_BUILD) -Pjni.gpr -cargs -I/opt/oracle-jdk-bin-1.8.0.202/include  -cargs -I/opt/oracle-jdk-bin-1.8.0.202/include/$(JNI_BUILD)

# Add clean lib targets here

.PHONY: clean

clean:
	$(GPRCLEAN) -Pjni.gpr

########################################################################################################################
# Tests

.PHONY: $(TESTS_SRCS)

tests: $(LIB_NAME) tests.gpr $(TESTS_SRCS)

tests.gpr: $(TESTS_SRCS)
	$(GPRBUILD) -p -XJNI_MODE=$(JNI_MODE) -XJNI_BUILD=$(JNI_BUILD) -Ptests.gpr -largs -ljvm -L/opt/oracle-jdk-bin-1.8.0.202/jre/lib/amd64/server/

########################################################################################################################

.PHONY: todo

todo:
	grep -riw --color TODO $(SRC)
