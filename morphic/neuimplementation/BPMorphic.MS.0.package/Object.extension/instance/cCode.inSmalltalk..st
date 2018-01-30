*BPMorphic
cCode: codeStringOrBlock inSmalltalk: aBlock
  "Support for Smalltalk-to-C translation. The first argument is output when generating C code.
	 But if this code is being simulated in Smalltalk, answer the result of evaluating the given block.
	 If the first argument is a string it is output literally, and if it is a block it is translated."

  ^ aBlock value