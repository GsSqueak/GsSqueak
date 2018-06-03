API
GciTsExecute: session a: sourceString a: sourceOop a: contextObject a: symbolList a: flags a: environmentId err: error
"/*================================================
 *  GciTsExecute
 *
 *  returns OOP_ILLEGAL if an error was returned in *err .
 *  If sourceStr is not NULL, it is used as the source string,
 *  and sourceOop specifies a class, typically OOP_CLASS_STRING or OOP_CLASS_Utf8,
 *  If sourceStr == NULL, then sourceOop is expected to be a kind of
 *  String, Unicode16, Unicode32, or Utf8 .
 *  If contextObj != OOP_ILLEGAL, source is compiled as if
 *  it were an instance method of the class of contextObj,
 *  otherwise compilation produces an anonymous method in which self == nil.
 *  If symbolList == OOP_NIL, use (System myUserProfile symbolList)
 *  to resolve literals in the compilation, otherwise use symbolList argument. 
 */"
	<cdecl: ulonglong 'GciTsExecute' (GciSessionType* char* ulonglong ulonglong ulonglong long ushort GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(OopType) GciTsExecute(GciSession sess,
            const char* sourceStr,
            OopType sourceOop,
            OopType contextObject,
            OopType symbolList,
            int flags /* per GCI_PERFORM_FLAG* in gcicmn.ht */,
            ushort environmentId /* normally zero*/,
            GciErrSType *err);"