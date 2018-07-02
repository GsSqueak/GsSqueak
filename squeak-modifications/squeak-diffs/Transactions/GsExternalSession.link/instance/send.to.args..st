sending
send: aSelector to: anOop args: anArray
    ^ self _env0 send: 'perform:env:withArguments:' to: anOop withArguments: (Array with: aSelector with: 7 with: anArray)
