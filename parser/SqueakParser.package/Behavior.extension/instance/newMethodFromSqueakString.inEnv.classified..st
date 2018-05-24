*SqueakParser
newMethodFromSqueakString: aString inEnv: env classified: aProtocol
  | parser meth ast gsAst gsMethod class methDict |
  parser := SqParser new.
  ast := parser parse: aString class: self.
  ^ self compileMethodFromAST: ast classified: aProtocol inEnv: env