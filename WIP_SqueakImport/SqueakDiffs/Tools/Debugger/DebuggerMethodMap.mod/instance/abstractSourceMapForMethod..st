source mapping
abstractSourceMapForMethod: aCompiledMethod
	"The default source mapping is for block bytecodes embedded within a
	 single compiled method, as in the BlueBook and EncoderForV3PlusClosures."
	^self abstractSourceMap