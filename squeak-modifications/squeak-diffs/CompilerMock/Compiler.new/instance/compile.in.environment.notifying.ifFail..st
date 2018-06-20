public access
compile: textOrStream in: aClass environment: anEnvironment notifying: aRequestor ifFail: failBlock
    | sourceText |
    
    sourceText := (textOrStream isKindOf: Stream)
        ifTrue: [ textOrStream contents ]
        ifFalse: [ textOrStream ].
    ^ [ aClass _env0 newMethodFromSqueakString: sourceText inEnv: 7 ] on: Error do: failBlock

