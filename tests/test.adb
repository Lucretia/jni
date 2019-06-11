-- with Ada.Characters.Latin_1;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with JNI; use JNI;
with System;
with Text_IO; use Text_IO;

procedure Test is
   -- package L1 renames Ada.Characters.Latin_1;

   VM      : Java_VM_Ptr_Ptr;
   Env     : Env_Ptr_Ptr;

   Options : aliased VM_Option_Arrays (0 .. 0) :=
      (0 => (Option_String => New_String ("-verbose:jni"),
             Extra_Info    => System.Null_Address));

   Args    : aliased VM_Init_Args :=
      (Version             => JNI_VERSION_1_8,
       Total_Options       => Options'Length,
       Options             => Options (0)'Unchecked_Access,
       Ignore_Unrecognised => True);

   Java_System_Class_Name      : chars_ptr               := New_String ("java/lang/System");
   Java_Out_Name               : chars_ptr               := New_String ("out");
   Java_Out_Name_Sig           : chars_ptr               := New_String ("Ljava/io/PrintStream;");
   Java_PrintStream_Class_Name : chars_ptr               := New_String ("java/io/PrintStream");
   Java_Println_Name           : chars_ptr               := New_String ("println");
   Java_Println_Name_Sig       : chars_ptr               := New_String ("(Ljava/lang/String;)V");
   Java_Message_Unicode_C      : aliased char16_array    := To_C ("Hello from Java");
   Java_Message_Unicode        : jchar_Array_Ptr.Pointer := Java_Message_Unicode_C (0)'Unchecked_Access;
   Java_System_Class           : jclass;
   Java_Out_Field_ID           : JNI.jfieldID;
   Java_Out_Object             : JNI.jobject;
   Java_PrintStream_Class      : jclass;
   Java_Println_Method_ID      : JNI.jmethodID;
   Java_Message                : jstring;
   Java_Println_Args           : aliased jobject_Arrays (0 .. 0);
   Result                      : jint := JNI.Create_Java_VM (VM, Env, Args'Unchecked_Access);

   use type jint;
begin
   if Result /= JNI_OK then
      Put_Line ("Error! Cannot create Java VM.");
   else
      --  Get the System class.
      Java_System_Class := Env.all.Find_Class (Env, Java_System_Class_Name);

      --  Get the out static field.
      Java_Out_Field_ID := Env.all.Get_Static_Field_ID (Env, Java_System_Class, Java_Out_Name, Java_Out_Name_Sig);
      Java_Out_Object   := Env.all.Get_Static_Object_Field (Env, Java_System_Class, Java_Out_Field_ID);

      --  Get the PrintStream class.
      Java_PrintStream_Class := Env.all.Find_Class (Env, Java_PrintStream_Class_Name);

      --  Get the println(String) method.
      Java_Println_Method_ID := Env.all.Get_Method_ID (Env, Java_PrintStream_Class, Java_Println_Name, Java_Println_Name_Sig);

      --  Invoke println.
      Java_Message := Env.all.New_String (Env, Java_Message_Unicode, Java_Message_Unicode_C'Length);

      Java_Println_Args (0) := Java_Message;

      Env.all.Call_Void_Method_A (Env, Java_Out_Object, Java_Println_Method_ID, Java_Println_Args (0)'Unchecked_Access);
   end if;

   --  Free all the C strings allocated.
   for S of Options loop
      Free (S.Option_String);
   end loop;

   Free (Java_System_Class_Name);
   Free (Java_Out_Name);
   Free (Java_Out_Name_Sig);
   Free (Java_PrintStream_Class_Name);
   Free (Java_Println_Name);
   Free (Java_Println_Name_Sig);
   -- Free (Java_Message_Unicode);

   if VM.all.Destroy_Java_VM (VM) /= JNI_OK then
      Put_Line ("Error! Cannot destroy Java VM.");
   end if;
end Test;
