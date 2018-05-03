*BPBugFixes
parseSelector: methodString
  | selector tokens |
  tokens := Scanner new scanMessageParts: methodString.
  selector := WriteStream on: String new.
  1 to: tokens size - 1 by: 4 do: [ :index | 
    | token |
    token := tokens at: index + 1.
    token ifNotNil: [ selector nextPutAll: token asString ] ].
  ^ selector contents