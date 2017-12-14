as yet unclassified
loadClass: aClassSpec inEnv: envId
  | rwStream |
  rwStream := RWBinaryOrTextStream on: aClassSpec.
  [ rwStream fileInInEnv: envId ]
    on: CompileError
    do: [ :sig | 
      | err |
      err := sig gsArguments first.
      (err first at: 3) = 'undefined symbol'
        ifTrue: [ 
          (GsConfirmInteraction
            prompt: 'missing superclass: ' , (err first at: 5)
            confirm: 'Load') signal
            ifTrue: [ 
              self importClass: (err first at: 5) asSymbol inEnv: envId.
              self loadClass: aClassSpec inEnv: envId ] ] ]