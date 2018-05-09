private
isProcedure: anObject
  ^ anObject isLispPrimitive
    or: [ anObject isProcedure ]
    or: [ anObject isCompiledProcedure ]