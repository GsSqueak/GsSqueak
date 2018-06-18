class GciErrSType {
public:
  OopType       category;                      /* error dictionary       */
  OopType       context;  /* GemStone Smalltalk execution state , a GsProcess */
  OopType       exceptionObj;  /* an instance of AbstractException, or nil; may be nil
                                 if error was not signaled from Smalltalk execution */
  OopType       args[10];        /* arguments to error text */
  int          number;                        /* GemStone error number  */
  int          argCount;                      /* num of arg in the args[]*/
  unsigned char fatal;                         /* nonzero if err is fatal */
  // Since Gs64 v3.2.0  message and reason are Utf8 .
  char          message[1024 + 1]; /* null-termated Utf8 error text */
  char          reason[1024 + 1]; /* null terminated Utf8 */

  // If you change this struct,  Smalltalk client FFI code may
  //  need smalltalk code changes.

  inline void init(void) {
    category = OOP_NIL;
    exceptionObj = OOP_NIL;
    number = 0;
    context = OOP_NIL;
    argCount = 0;
    fatal = FALSE;
    message[0] = '\0';
    reason[0] = '\0';
    args[0] = OOP_ILLEGAL;
  }

  GciErrSType() { init(); }
  ~GciErrSType() { }

  GciErrSType(GciErrSType *src);

  void setError(int errNum, const char* msg);
  void setFatalError(int errNum, const char* msg);

  void appendStr(const char* str); // appends str to message
}; 