*BPToolsTode
scanFrom: aStream inEnv: envID
  "File in methods from the stream, aStream."

  | methodText |
  [ 
  methodText := aStream nextChunk.
  methodText size > 0 ]
    whileTrue: [ 
      class
        compileMethod: methodText withGemstoneLineEndings
        category: category
        environmentId: envID.
      changeStamp ~~ nil
        ifTrue: [ 
          class
            setStamp: changeStamp
            forMethod: (Behavior parseSelector: methodText for: class) ] ]
