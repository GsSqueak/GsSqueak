as yet unclassified
doesNotUnderstand: aSymbol args: anArray envId: envId
  "Generates an error reporting that the receiver cannot respond to a message.
 because no compiled method was found for aSymbol in method environment
envId.   envId is a SmallInteger, 0 for Smalltalk , 1 for Ruby
2..255 for future use by Smalltalk package managers .
"

  | ex |
  aSymbol == #'perform:withArguments:'
    ifTrue: [ 
      "MNU from #perform:env:withArguments: ... unpack selector and args to resend"
      ^ self actualGsProcess
        perform: (anArray at: 1)
        withArguments: (anArray at: 3) ].
  ^ self actualGsProcess perform: aSymbol withArguments: anArray
