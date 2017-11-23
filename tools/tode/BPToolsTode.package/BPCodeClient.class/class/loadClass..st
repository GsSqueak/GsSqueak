as yet unclassified
loadClass: aClassSpec
  | rwStream |
  rwStream := RWBinaryOrTextStream on: aClassSpec.
  [ rwStream fileIn ]
    on: CompileError
    do: [ :sig | 
      | err |
      err := sig gsArguments first.
      (err first at: 3) = 'undefined symbol'
        ifTrue: [ Transcript show: 'missing:' , (err first at: 5) ] ]