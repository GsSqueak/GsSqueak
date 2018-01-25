as yet unclassified
doesNotUnderstand: aMessageDescriptor
  | returnValue |
  returnValue := self actualGsProcess
    perform: aMessageDescriptor selector
    withArguments: aMessageDescriptor arguments.
  returnValue class == GsProcess
    ifTrue: [ ^ self ].
  ^ returnValue
