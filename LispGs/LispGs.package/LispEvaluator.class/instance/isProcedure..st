private
isProcedure: anObject
  ^ anObject isLispPrimitive
    or: [ anObject isLispClosure ]
    or: [ anObject isCompiledProcedure ]