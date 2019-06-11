with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Pointers;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;
with JNI_MD;               --  use JNI_MD;

package JNI is
   JNI_OK          : constant :=  0;  --  Success.
   JNI_ERR         : constant := -1;  --  Unknown error.
   JNI_EDETACHED   : constant := -2;  --  Thread detached from the VM.
   JNI_EVERSION    : constant := -3;  --  JNI version error.
   JNI_ENOMEM      : constant := -4;  --  Not enough memory.
   JNI_EEXIST      : constant := -5;  --  VM already created.
   JNI_EINVAL      : constant := -6;  --  Invalid arguments.

   JNI_COMMIT      : constant := 1;
   JNI_ABORT       : constant := 2;

   --  Basic Java types.
   subtype jchar    is char16_t;
   subtype jbyte    is JNI_MD.jbyte;
   subtype jint     is JNI_MD.jint;
   subtype jshort   is short;
   subtype jlong    is JNI_MD.jlong;
   subtype jfloat   is C_float;
   subtype jdouble  is double;
   subtype jsize    is jint;

   type jboolean is (False, True) with
     Convention => C;

   type jboolean_Ptr_Arrays is array (jsize range <>) of aliased jboolean with
     Convention => C;

   package jboolean_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jboolean,
       Element_Array      => jboolean_Ptr_Arrays,
       Default_Terminator => False);

   use type jboolean_Array_Ptr.Pointer;

   --  Array and pointer types for the primitive types.

   --  jchar types.
   type jchar_Ptr_Arrays is array (jsize range <>) of aliased jchar with
     Convention => C;

   package jchar_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jchar,
       Element_Array      => jchar_Ptr_Arrays,
       Default_Terminator => jchar'Val (0));

   use type jchar_Array_Ptr.Pointer;

   --  jbyte types.
   type jbyte_Ptr_Arrays is array (jsize range <>) of aliased jbyte with
     Convention => C;

   package jbyte_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jbyte,
       Element_Array      => jbyte_Ptr_Arrays,
       Default_Terminator => 0);

   use type jbyte_Array_Ptr.Pointer;

   --  jshort types.
   type jshort_Ptr_Arrays is array (jsize range <>) of aliased jshort with
     Convention => C;

   package jshort_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jshort,
       Element_Array      => jshort_Ptr_Arrays,
       Default_Terminator => 0);

   use type jshort_Array_Ptr.Pointer;

   --  jint types.
   type jint_Ptr_Arrays is array (jsize range <>) of aliased jint with
     Convention => C;

   package jint_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jint,
       Element_Array      => jint_Ptr_Arrays,
       Default_Terminator => 0);

   use type jint_Array_Ptr.Pointer;

   --  jlong types.
   type jlong_Ptr_Arrays is array (jsize range <>) of aliased jlong with
     Convention => C;

   package jlong_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jlong,
       Element_Array      => jlong_Ptr_Arrays,
       Default_Terminator => 0);

   use type jlong_Array_Ptr.Pointer;

   --  jfloat types.
   type jfloat_Ptr_Arrays is array (jsize range <>) of aliased jfloat with
     Convention => C;

   package jfloat_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jfloat,
       Element_Array      => jfloat_Ptr_Arrays,
       Default_Terminator => 0.0);

   use type jfloat_Array_Ptr.Pointer;

   --  jdouble types.
   type jdouble_Ptr_Arrays is array (jsize range <>) of aliased jdouble with
     Convention => C;

   package jdouble_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jdouble,
       Element_Array      => jdouble_Ptr_Arrays,
       Default_Terminator => 0.0);

   use type jdouble_Array_Ptr.Pointer;

   --  jsize types.
   type jsize_Ptr_Arrays is array (jsize range <>) of aliased jsize with
     Convention => C;

   package jsize_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jsize,
       Element_Array      => jsize_Ptr_Arrays,
       Default_Terminator => -1);

   use type jsize_Array_Ptr.Pointer;

   --  Object types.
   type jobject_Type is null record;

   type jobject is access all jobject_Type with
     Convention => C;

   type jobject_Arrays is array (jsize range <>) of aliased jobject with
     Convention => C;

   package jobject_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jobject,
       Element_Array      => jobject_Arrays,
       Default_Terminator => null);

   use type jobject_Array_Ptr.Pointer;

   --  Composite types derive from jobject.
   subtype jclass        is jobject;
   subtype jthrowable    is jobject;
   subtype jstring       is jobject;

   --  jclass types.
   type jclass_Arrays is array (jsize range <>) of aliased jclass with
     Convention => C;

   package jclass_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jclass,
       Element_Array      => jclass_Arrays,
       Default_Terminator => null);

   use type jclass_Array_Ptr.Pointer;

   --  jthrowable types.
   type jthrowable_Arrays is array (jsize range <>) of aliased jthrowable with
     Convention => C;

   package jthrowable_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jthrowable,
       Element_Array      => jthrowable_Arrays,
       Default_Terminator => null);

   use type jthrowable_Array_Ptr.Pointer;

   --  jstring types.
   type jstring_Arrays is array (jsize range <>) of aliased jstring with
     Convention => C;

   package jstring_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => jstring,
       Element_Array      => jstring_Arrays,
       Default_Terminator => null);

   use type jstring_Array_Ptr.Pointer;

   subtype jarray        is jobject;
   subtype jbooleanArray is jarray;
   subtype jbyteArray    is jarray;
   subtype jcharArray    is jarray;
   subtype jshortArray   is jarray;
   subtype jintArray     is jarray;
   subtype jlongArray    is jarray;
   subtype jfloatArray   is jarray;
   subtype jdoubleArray  is jarray;
   subtype jobjectArray  is jarray;
   subtype jweak         is jobject;

   type jvalue (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            z : aliased jboolean;
         when 1 =>
            b : aliased jbyte;
         when 2 =>
            c : aliased jchar;
         when 3 =>
            s : aliased jshort;
         when 4 =>
            i : aliased jint;
         when 5 =>
            j : aliased jlong;
         when 6 =>
            f : aliased jfloat;
         when 7 =>
            d : aliased jdouble;
         when others =>
            l : jobject;
      end case;
   end record with
     Convention      => C_Pass_By_Copy,
     Unchecked_Union => True;

   type Versions is new jint;

   JNI_VERSION_1_1 : constant Versions := 16#0001_0001#;
   JNI_VERSION_1_2 : constant Versions := 16#0001_0002#;
   JNI_VERSION_1_4 : constant Versions := 16#0001_0004#;
   JNI_VERSION_1_6 : constant Versions := 16#0001_0006#;
   JNI_VERSION_1_8 : constant Versions := 16#0001_0008#;
   JNI_VERSION_9   : constant Versions := 16#0009_0000#;
   JNI_VERSION_10  : constant Versions := 16#000a_0000#;

   -- Null_jvalue : constant jvalue := (discr => unsigned'Last, l => null);

   -- type jvalue_Arrays is array (jsize range <>) of aliased jvalue with
   --   Convention => C;

   -- package jvalue_Array_Ptr is new Interfaces.C.Pointers
   --    (Index              => jsize,
   --     Element            => jvalue,
   --     Element_Array      => jvalue_Arrays,
   --     Default_Terminator => Null_jvalue);

   -- use type jvalue_Array_Ptr.Pointer;

   type jfieldID_Type is null record;

   type jfieldID is access all jfieldID_Type with
     Convention => C;

   type jmethodID_Type is null record;

   type jmethodID is access all jmethodID_Type with
     Convention => C;

   type jobject_Ref_Type is
     (Invalid_Ref_Type,
      Local_Ref_Type,
      Global_Ref_Type,
      Weak_Global_Ref_Type) with
     Convention => C;

   type Native_Method is record
      Name         : chars_ptr;
      Signature    : chars_ptr;
      Function_Ptr : System.Address;
   end record with
     Convention => C_Pass_By_Copy;

   type Native_Method_Arrays is array (jint range <>) of aliased Native_Method with
     Convention => C;

   package Native_Method_Ptr is new Interfaces.C.Pointers
      (Index              => jint,
       Element            => Native_Method,
       Element_Array      => Native_Method_Arrays,
       Default_Terminator => Native_Method'(Name | Signature => null, Function_Ptr => System.Null_Address));

   use type Native_Method_Ptr.Pointer;

   --  This this is all to cover C's pointer to point mess!

   --  JavaVM = JNIInvokeInterface_!!
   type Java_VMs;
   type Java_VM_Ptr is access all Java_VMs with
     Convention => C;
   type Java_VM_Ptr_Ptr is access all Java_VM_Ptr with
     Convention => C;

   --  JNIEnv.
   -- type Environment is null record with
   --   Convention => C;
   type Environment;
   type Env_Ptr is access all Environment with
     Convention => C;
   type Env_Ptr_Ptr is access all Env_Ptr with
     Convention => C;

   type Environment is record
      reserved_0 : System.Address;
      reserved_1 : System.Address;
      reserved_2 : System.Address;
      reserved_3 : System.Address;

      Get_Version : access function (Environment : in not null Env_Ptr_Ptr) return Versions;

      Define_Class : access function
         (Environment : in not null Env_Ptr_Ptr;
          Name        : in chars_ptr;
          Loader      : in jobject;
          Bufffer     : access jbyte;
          Length      : in jsize) return jclass;

      Find_Class : access function
         (Environment : in not null Env_Ptr_Ptr;
          Name        : in chars_ptr) return jclass;

      From_Reflected_Method : access function
         (Environment : in not null Env_Ptr_Ptr;
          Method      : in not null jobject) return jmethodID;

      From_Reflected_Field : access function
         (Environment : in not null Env_Ptr_Ptr;
          Field       : in not null jobject) return jfieldID;

      To_Reflected_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : in not null jmethodID;
            Is_Static   : in jboolean) return jobject;

      Get_Superclass : access function
         (Environment : in not null Env_Ptr_Ptr;
          Sub_Class   : in not null jclass) return jclass;

      Is_Assignable_From : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class_1     : in not null jclass;
            Class_2     : in not null jclass) return jboolean;

      To_Reflected_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : in not null jfieldID;
            Is_Static   : in jboolean) return jobject;

      Throw : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in not null jthrowable) return jint;

      Throw_New : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Message     : in chars_ptr) return jint;

      Exception_Occurred : access function (Environment : in not null Env_Ptr_Ptr) return jthrowable;

      Exception_Describe : access procedure (Environment : in not null Env_Ptr_Ptr);

      Exception_Clear : access procedure (Environment : in not null Env_Ptr_Ptr);

      Fatal_Error : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Message     : in chars_ptr);

      Push_Local_Frame : access function
         (Environment : in not null Env_Ptr_Ptr;
          Capacity    : in jint) return jint;

      Pop_Local_Frame : access function
         (Environment : in not null Env_Ptr_Ptr;
          Result      : in out jobject) return jobject;

      New_Global_Ref : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in jobject) return jobject;

      Delete_Global_Ref : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Global_Ref  : in jobject);

      Delete_Local_Ref : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Local_Ref   : in jobject);

      Is_Same_Object : access function
           (Environment : in not null Env_Ptr_Ptr;
            Ref_1       : in jobject;
            Ref_2       : in jobject) return jboolean;

      New_Local_Ref : access function
         (Environment : in not null Env_Ptr_Ptr;
          Ref         : in jobject) return jobject;

      Ensure_Local_Capacity : access function
         (Environment : in not null Env_Ptr_Ptr;
          Capacity    : in jint) return jint; -- TODO: Change type?

      Alloc_Object : access function
         (Environment : in not null Env_Ptr_Ptr;
          Class       : in not null jclass) return jobject;

      New_Object : access function
           (Environment : in not null Env_Ptr_Ptr;
            arg2 : jclass;
            arg3 : jmethodID
            ) return jobject; -- TODO: DO NOT USE, IS varargs, will need a generic for this.

      New_Object_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            arg2 : jclass;
            arg3 : jmethodID;
            arg4 : access System.Address) return jobject;  -- TODO: DO NOT USE, arg4 = va_list type.

      New_Object_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            method_ID   : in not null jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer) return jobject;

      Get_Object_Class : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in not null jobject) return jclass;

      Is_Instance_Of : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in jobject;
            Class       : in not null jclass) return jboolean;

      Get_Method_ID : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Name        : in chars_ptr;
            Signature   : in chars_ptr) return jmethodID;

      Call_Object_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jobject; -- TODO: varargs

      Call_Object_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jobject; -- TODO: va_list.

      Call_Object_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer) return jobject;

      Call_Boolean_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jboolean; -- TODO: varargs

      Call_Boolean_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jboolean; -- TODO: va_list.

      Call_Boolean_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jboolean_Array_Ptr.Pointer) return jboolean;

      Call_Byte_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jbyte; -- TODO: varargs

      Call_Byte_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jbyte; -- TODO: va_list.

      Call_Byte_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jbyte_Array_Ptr.Pointer) return jbyte;

      Call_Char_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jchar; -- TODO: varargs

      Call_Char_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jchar; -- TODO: va_list.

      Call_Char_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jchar_Array_Ptr.Pointer) return jchar;

      Call_Short_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jshort; -- TODO: varargs

      Call_Short_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jshort; -- TODO: va_list.

      Call_Short_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jshort_Array_Ptr.Pointer) return jshort;

      Call_Int_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jint; -- TODO: varargs

      Call_Int_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jint; -- TODO: va_list.

      Call_Int_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jint_Array_Ptr.Pointer) return jint;

      Call_Long_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jlong; -- TODO: varargs

      Call_Long_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jlong; -- TODO: va_list.

      Call_Long_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jlong_Array_Ptr.Pointer) return jlong;

      Call_Float_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jfloat; -- TODO: varargs

      Call_Float_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jfloat; -- TODO: va_list.

      Call_Float_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jfloat_Array_Ptr.Pointer) return jfloat;

      Call_Double_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ) return jdouble; -- TODO: varargs

      Call_Double_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address) return jdouble; -- TODO: va_list.

      Call_Double_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jdouble_Array_Ptr.Pointer) return jdouble;

      Call_Void_Method : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID
            ); -- TODO: varargs

      Call_Void_Method_V : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Args        : access System.Address); -- TODO: va_list.

      Call_Void_Method_A : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer);

      Call_Non_Virtual_Object_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Method_ID   : jmethodID;
            arg4 : jmethodID
            ) return jobject; -- TODO: varargs

      Call_Non_Virtual_Object_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jobject; -- TODO: va_list.

      Call_Non_Virtual_Object_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer) return jobject;

      Call_Non_Virtual_Boolean_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jboolean; -- TODO: varargs

      Call_Non_Virtual_Boolean_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jboolean; -- TODO: va_list.

      Call_Non_Virtual_Boolean_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jboolean_Array_Ptr.Pointer) return jboolean;

      Call_Non_Virtual_Byte_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jbyte; -- TODO: varargs

      Call_Non_Virtual_Byte_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jbyte; -- TODO: va_list.

      Call_Non_Virtual_Byte_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jbyte_Array_Ptr.Pointer) return jbyte;

      Call_Non_Virtual_Char_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jchar; -- TODO: varargs

      Call_Non_Virtual_Char_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jchar; -- TODO: va_list.

      Call_Non_Virtual_Char_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jchar_Array_Ptr.Pointer) return jchar;

      Call_Non_Virtual_Short_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jshort; -- TODO: varargs

      Call_Non_Virtual_Short_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jshort; -- TODO: va_list.

      Call_Non_Virtual_Short_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jshort_Array_Ptr.Pointer) return jshort;

      Call_Non_Virtual_Int_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jint; -- TODO: varargs

      Call_Non_Virtual_Int_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jint; -- TODO: va_list.

      Call_Non_Virtual_Int_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jint_Array_Ptr.Pointer) return jint;

      Call_Non_Virtual_Long_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jlong; -- TODO: varargs

      Call_Non_Virtual_Long_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jlong; -- TODO: va_list.

      Call_Non_Virtual_Long_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jlong_Array_Ptr.Pointer) return jlong;

      Call_Non_Virtual_Float_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jfloat; -- TODO: varargs

      Call_Non_Virtual_Float_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jfloat; -- TODO: va_list.

      Call_Non_Virtual_Float_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jfloat_Array_Ptr.Pointer) return jfloat;

      Call_Non_Virtual_Double_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jdouble; -- TODO: varargs

      Call_Non_Virtual_Double_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address) return jdouble; -- TODO: va_list.

      Call_Non_Virtual_Double_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jdouble_Array_Ptr.Pointer) return jdouble;

      Call_Non_Virtual_Void_Method : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ); -- TODO: varargs

      Call_Non_Virtual_Void_Method_V : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg5 : access System.Address); -- TODO: va_list.

      Call_Non_Virtual_Void_Method_A : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer);

      Get_Field_ID : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Name        : in chars_ptr;
            Signature   : in chars_ptr) return jfieldID;

      Get_Object_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jobject;

      Get_Boolean_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jboolean;

      Get_Byte_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jbyte;

      Get_Char_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jchar;

      Get_Short_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jshort;

      Get_Int_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jint;

      Get_Long_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jlong;

      Get_Float_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jfloat;

      Get_Double_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID) return jdouble;

      Set_Object_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jobject);

      Set_Boolean_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jboolean);

      Set_Byte_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jbyte);

      Set_Char_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jchar);

      Set_Short_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jshort);

      Set_Int_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jint);

      Set_Long_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jlong);

      Set_Float_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jfloat);

      Set_Double_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Object      : in not null jobject;
            Field_ID    : jfieldID;
            Value       : jdouble);

      Get_Static_Method_ID : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Name        : in chars_ptr;
            Signature   : in chars_ptr) return jmethodID;

      Call_Static_Object_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jobject;

      Call_Static_Object_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jobject; -- TODO: va_list.

      Call_Static_Object_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer) return jobject;

      Call_Static_Boolean_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jboolean; -- TODO: varargs

      Call_Static_Boolean_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jboolean; -- TODO: va_list.

      Call_Static_Boolean_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jboolean_Array_Ptr.Pointer) return jboolean;

      Call_Static_Byte_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jbyte; -- TODO: varargs

      Call_Static_Byte_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jbyte; -- TODO: va_list.

      Call_Static_Byte_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jbyte_Array_Ptr.Pointer) return jbyte;

      Call_Static_Char_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jchar; -- TODO: varargs

      CallStaticCharMethodV : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jchar;

      Call_Static_Char_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jchar_Array_Ptr.Pointer) return jchar;

      Call_Static_Short_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jshort; -- TODO: varargs

      Call_Static_Short_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jshort; -- TODO: va_list.

      Call_Static_Short_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jshort_Array_Ptr.Pointer) return jshort;

      Call_Static_Int_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jint; -- TODO: varargs

      Call_Static_Int_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jint; -- TODO: va_list.

      Call_Static_Int_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jint_Array_Ptr.Pointer) return jint;

      Call_Static_Long_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jlong; -- TODO: varargs

      Call_Static_Long_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jlong; -- TODO: va_list.

      Call_Static_Long_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jlong_Array_Ptr.Pointer) return jlong;

      Call_Static_Float_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jfloat; -- TODO: varargs

      Call_Static_Float_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jfloat; -- TODO: va_list.

      Call_Static_Float_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jfloat_Array_Ptr.Pointer) return jfloat;

      Call_Static_Double_Method : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ) return jdouble; -- TODO: varargs

      Call_Static_Double_Method_V : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address) return jdouble; -- TODO: va_list.

      Call_Static_Double_Method_A : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jdouble_Array_Ptr.Pointer) return jdouble;

      Call_Static_Void_Method : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID
            ); -- TODO: varargs

      Call_Static_Void_Method_V : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            arg4 : access System.Address); -- TODO: va_list.

      Call_Static_Void_Method_A : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Method_ID   : jmethodID;
            Arg_Array   : jobject_Array_Ptr.Pointer);

      Get_Static_Field_ID : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Name        : in chars_ptr;
            Signature   : in chars_ptr) return jfieldID;

      Get_Static_Object_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jobject;

      Get_Static_Boolean_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jboolean;

      Get_Static_Byte_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jbyte;

      Get_Static_Char_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jchar;

      Get_Static_Short_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jshort;

      Get_Static_Int_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jint;

      Get_Static_Long_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jlong;

      Get_Static_Float_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jfloat;

      Get_Static_Double_Field : access function
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID) return jdouble;

      Set_Static_Object_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jobject);

      Set_Static_Boolean_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jboolean);

      Set_Static_Byte_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jbyte);

      Set_Static_Char_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jchar);

      Set_Static_Short_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jshort);

      Set_Static_Int_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jint);

      Set_Static_Long_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jlong);

      Set_Static_Float_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jfloat);

      Set_Static_Double_Field : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Class       : in not null jclass;
            Field_ID    : jfieldID;
            Value       : jdouble);

      New_String : access function
           (Environment        : in not null Env_Ptr_Ptr;
            Unicode_Characters : jchar_Array_Ptr.Pointer;
            Length             : jsize) return jstring; -- TODO: See below
      --   Static_Predicate => Unicode_Characters = null and Length = 0;

      Get_String_Length : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring) return jsize;

      Get_String_Chars : access function
           (Environment : in not null Env_Ptr_Ptr;
            Java_String : in not null jstring;
            Is_Copy     : access jboolean) return access jchar;

      Release_String_Chars : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Java_String : in not null jstring;
            Chars       : access jchar);

      New_String_UTF : access function
         (Environment : in not null Env_Ptr_Ptr;
          Bytes       : in chars_ptr) return jstring;

      Get_String_UTF_Length : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring) return jsize;

      Get_String_UTF_Chars : access function
           (Environment : in not null Env_Ptr_Ptr;
            Java_String : in not null jstring;
            Is_Copy     : access jboolean) return chars_ptr;

      Release_String_UTF_Chars : access procedure
           (Environment : in not null Env_Ptr_Ptr;
            Java_String : in not null jstring;
            UTF         : in chars_ptr);

      Get_Array_Length : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jarray) return jsize;

      New_Object_Array : access function
           (Environment     : in not null Env_Ptr;
            Length          : in jsize;
            Element_Class   : in not null jclass;
            Initial_Element : in jobject) return jobjectArray; --  with
      --   Pre => Length >= 0;

      Get_Object_Array_Element : access function
           (Environment  : in not null Env_Ptr;
            Object_Array : in not null jobjectArray;
            Index        : jsize) return jobject; --  with
      --   Static_Predicate => Index >= 0;

      Set_Object_Array_Element : access procedure
           (Environment  : in not null Env_Ptr;
            Object_Array : in not null jobjectArray;
            Index        : jsize;
            Value        : in jobject); --  with
      --   Static_Predicate => Index >= 0;

      New_Boolean_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jbooleanArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Byte_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jbyteArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Char_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jcharArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Short_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jshortArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Int_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jintArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Long_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jlongArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Float_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jfloatArray; --  with
      --   Static_Predicate => Length >= 0;

      New_Double_Array : access function
          (Environment : in not null Env_Ptr_Ptr;
           Length      : in jsize) return jdoubleArray; --  with
      --   Static_Predicate => Length >= 0;

      Get_Boolean_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbooleanArray;
          Is_Copy     : access jboolean) return access jboolean;

      Get_Byte_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbyteArray;
          Is_Copy     : access jboolean) return access jbyte;

      Get_Char_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jcharArray;
          Is_Copy     : access jboolean) return access jchar;

      Get_Short_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jshortArray;
          Is_Copy     : access jboolean) return access jshort;

      Get_Int_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jintArray;
          Is_Copy     : access jboolean) return access jint;

      Get_Long_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jlongArray;
          Is_Copy     : access jboolean) return access jlong;

      Get_Float_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jfloatArray;
          Is_Copy     : access jboolean) return access jfloat;

      Get_Double_Array_Elements : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jdoubleArray;
          Is_Copy     : access jboolean) return access jdouble;

      Release_Boolean_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbooleanArray;
          Elements    : access jboolean; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Byte_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbyteArray;
          Elements    : access jbyte; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Char_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jcharArray;
          Elements    : access jchar; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Short_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jshortArray;
          Elements    : access jshort; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Int_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jintArray;
          Elements    : access jint; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Long_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jlongArray;
          Elements    : access jlong; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Float_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jfloatArray;
          Elements    : access jfloat; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Release_Double_Array_Elements : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jdoubleArray;
          Elements    : access jdouble; -- TODO: Change to C.Pointer
          Mode        : in jint);

      Get_Boolean_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbooleanArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jboolean);

      Get_Byte_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbyteArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jbyte);

      Get_Char_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jcharArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jchar);

      Get_Short_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jshortArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jshort);

      Get_Int_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jintArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jint);

      Get_Long_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jlongArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jlong);

      Get_Float_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jfloatArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jfloat);

      Get_Double_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jdoubleArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jdouble);

      Set_Boolean_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbooleanArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jboolean);

      Set_Byte_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jbyteArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jbyte);

      Set_Char_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jcharArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jchar);

      Set_Short_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jshortArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jshort);

      Set_Int_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jintArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jint);

      Set_Long_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jlongArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jlong);

      Set_Float_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jfloatArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jfloat);

      Set_Double_Array_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_Array  : in not null jdoubleArray;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : not null access jdouble);

      Register_Natives  : access function
         (Environment   : in not null Env_Ptr;
          Class         : in not null jclass;
          Methods       : not null access Native_Method_Ptr.Pointer;
          Total_Methods : jint) return jint;

      Unregister_Natives : access function
         (Environment : in not null Env_Ptr_Ptr;
          Class       : in not null jclass) return jint;

      Monitor_Enter : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in not null jobject) return jint;

      Monitor_Exit : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in not null jobject) return jint;

      --  Note that the VM parameter is "JavaVM **vm" in C.
      Get_Java_VM : access function
         (Environment : in not null Env_Ptr_Ptr;
          VM          : out Java_VM_Ptr) return jint;

      Get_String_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : access jchar);

      Get_String_UTF_Region : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring;
          Start       : in jsize;
          Length      : in jsize;
          Buffer      : in chars_ptr);

      Get_Primitive_Array_Critical : access function
           (Environment : in not null Env_Ptr_Ptr;
            Java_Array  : in not null jarray;
            Is_Copy     : access jboolean) return System.Address; -- TODO: C.Pointers

      Release_Primitive_Array_Critical : access procedure
           (Environment    : in not null Env_Ptr;
            Java_Array     : in not null jarray;
            Critical_Array : in System.Address;
            Mode           : in jint);

      Get_String_Critical : access function
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring;
          Is_Copy     : access jboolean) return access jchar;

      Release_String_Critical : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Java_String : in not null jstring;
          Is_Copy     : access jchar);

      New_Weak_Global_Ref : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in jobject) return jweak;

      Delete_Weak_Global_Ref : access procedure
         (Environment : in not null Env_Ptr_Ptr;
          Object      : in jweak);

      Exception_Check : access function (Environment : in not null Env_Ptr_Ptr) return jboolean;

      New_Direct_Byte_Buffer : access function
           (Environment : in not null Env_Ptr_Ptr;
            Address     : in System.Address;
            Capacity    : in jlong) return jobject;

      Get_Direct_Buffer_Address : access function
         (Environment : in not null Env_Ptr_Ptr;
          Buffer      : in not null jobject) return System.Address;

      Get_Direct_Buffer_Capacity : access function
         (Environment : in not null Env_Ptr_Ptr;
          Buffer      : in not null jobject) return jlong;

      Get_Object_Ref_Type : access function
         (Environment : in not null Env_Ptr_Ptr;
          Object      : jobject) return jobject_Ref_Type;

      Get_Module : access function
         (Environment : in not null Env_Ptr_Ptr;
          Class       : in not null jclass) return jobject;
   end record with
     Convention => C_Pass_By_Copy;

   type VM_Options is record
      Option_String : chars_ptr;
      Extra_Info    : System.Address;
   end record with
     Convention => C_Pass_By_Copy;

   type VM_Option_Arrays is array (jsize range <>) of aliased VM_Options with
     Convention => C;

   package VM_Option_Array_Ptr is new Interfaces.C.Pointers
      (Index              => jsize,
       Element            => VM_Options,
       Element_Array      => VM_Option_Arrays,
       Default_Terminator => VM_Options'(null, System.Null_Address));

   use type VM_Option_Array_Ptr.Pointer;

   type VM_Init_Args is record
      Version             : Versions;
      Total_Options       : jint;
      Options             : VM_Option_Array_Ptr.Pointer;
      Ignore_Unrecognised : jboolean;
   end record with
     Convention => C_Pass_By_Copy;

   type VM_Init_Args_Ptr is access all VM_Init_Args with
     Convention => C;

   type VM_Attach_Args is record
      Version : jint;
      Name    : chars_ptr;
      Group   : jobject;
   end record with
     Convention => C_Pass_By_Copy;

   -- Invoke_Interface = Java_VMs.
   type Java_VMs is record
      reserved_0 : System.Address;
      reserved_1 : System.Address;
      reserved_2 : System.Address;

      Destroy_Java_VM : access function (VM : in Java_VM_Ptr_Ptr) return jint;

      Attach_Current_Thread : access function
         (VM   : in Java_VM_Ptr;
          Env  : System.Address;
          Args : System.Address) return jint;

      Detach_Current_Thread : access function (VM : in Java_VM_Ptr) return jint;

      Get_Env : access function
         (VM      : in Java_VM_Ptr_Ptr;
          Env     : System.Address;
          Version : in jint) return jint;

      Attach_Current_Thread_As_Daemon : access function
         (VM   : in Java_VM_Ptr_Ptr;
          Env  : System.Address;
          Args : System.Address) return jint;
   end record with
     Convention => C_Pass_By_Copy;

   function Get_Default_Java_VM_Init_Args (Args : System.Address) return jint with
     Convention    => C,
     Import        => True,
     External_Name => "JNI_GetDefaultJavaVMInitArgs";

   function Create_Java_VM
      (VM   : out Java_VM_Ptr_Ptr;
       Env  : out Env_Ptr_Ptr;
       Args : in VM_Init_Args_Ptr) return jint with
     Convention    => C,
     Import        => True,
     External_Name => "JNI_CreateJavaVM";

   -- function JNI_GetCreatedJavaVMs
   --       (VM   : access Native_Interface;
   --        Size  : jsize;
   --        Size_2 : jsize) return jint with
   --   Convention    => C,
   --   Import        => True,
   --   External_Name => "JNI_GetCreatedJavaVMs";

   function On_Load
      (VM       : in Java_VM_Ptr;
       Reserved : System.Address) return jint with
     Convention    => C,
     Import        => True,
     External_Name => "JNI_OnLoad";

   function On_Unload
      (VM       : in Java_VM_Ptr;
       Reserved : System.Address) return jint with
     Convention    => C,
     Import        => True,
     External_Name => "JNI_OnUnload";

   procedure Test;
end JNI;
