bootstrapping
bootstrapSmallIntegerAddition
  self
    compileForClassNamed: 'Integer'
      method: (Integer compiledMethodAt: '+') sourceString
      category: 'Arithmetic';
    compileForClassNamed: 'Integer'
      method: 'pharoObject ^true'
      category: 'PharoGS';
    yourself.
  System commit