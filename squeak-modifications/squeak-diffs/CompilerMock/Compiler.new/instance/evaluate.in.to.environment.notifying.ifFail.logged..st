public access
evaluate: textOrStream in: aContext to: receiver environment: anEnvironment notifying: aRequestor ifFail: failBlock logged: logFlag
    | sourceText |
    
    sourceText := (textOrStream isKindOf: Stream)
        ifTrue: [ textOrStream contents ]
        ifFalse: [ textOrStream ].
    [ receiver class _env0 newMethodFromSqueakString: 'doItCode ^ [', sourceText, '] value' inEnv: 7 ] on: Error do: failBlock.
    ^ receiver doItCode
