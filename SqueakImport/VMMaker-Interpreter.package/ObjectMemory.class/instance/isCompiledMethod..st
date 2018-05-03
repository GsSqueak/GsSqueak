interpreter access
isCompiledMethod: oop
    "Answer whether the argument object is of compiled method format"
    ^(self formatOf: oop) >= 12