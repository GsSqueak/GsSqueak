methods
sourceCodeAt: selector for: aBehavior ifAbsent: absentBlock
  | meth |
  meth := self method: selector for: aBehavior ifAbsent: [ ^ absentBlock value ].
  ^ meth sourceString