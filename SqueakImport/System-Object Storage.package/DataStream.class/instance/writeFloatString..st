write and read
writeFloatString: aFloat
    "PRIVATE -- Write the contents of a Float string.
     This is the slow way to write a Float--via its string rep'n."

    self writeByteArray: (aFloat printString)