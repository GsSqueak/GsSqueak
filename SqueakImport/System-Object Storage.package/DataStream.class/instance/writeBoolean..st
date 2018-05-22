write and read
writeBoolean: aBoolean
    "PRIVATE -- Write the contents of a Boolean.
     This method is now obsolete."

    byteStream nextPut: (aBoolean ifTrue: [1] ifFalse: [0])