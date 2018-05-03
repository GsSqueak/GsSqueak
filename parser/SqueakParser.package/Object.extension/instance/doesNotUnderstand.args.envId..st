*SqueakParser
doesNotUnderstand: aSymbol args: anArray envId: envId
  "Generates an error reporting that the receiver cannot respond to a message.
 because no compiled method was found for aSymbol in method environment
 envId.   envId is a SmallInteger, 0 for Smalltalk , 1 for Ruby , 
 2..255 for future use by Smalltalk package managers .
"

  | ex |
  envId == 7
    ifTrue: [ 
      (ex := ((Smalltalk at: #SqueakEnvironment) at: #'MessageNotUnderstood') @env7: new)
        @env7: message:
            (((Smalltalk at: #SqueakEnvironment) at: #'Message') @env7: selector: aSymbol arguments: anArray);
        @env7: receiver: self.
      ^ ex signal ].
  (ex := MessageNotUnderstood _basicNew)
    receiver: self
    selector: aSymbol
    args: anArray
    envId: envId.
  ^ ex signal	"fix for #40871"	"Legacy behavior was that you could fall through from an exception handler
without an explicit resume/return. The fix for 40871 will break applications 
that rely on the old behavior."	"If we continue from the error, re-try the send of the message that was
 not understood."	"^ self perform: aSymbol env: envId withArguments: anArray "
