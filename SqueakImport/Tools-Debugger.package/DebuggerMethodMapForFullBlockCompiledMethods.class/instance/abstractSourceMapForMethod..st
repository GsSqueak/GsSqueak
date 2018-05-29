source mapping
abstractSourceMapForMethod: compiledCode
	"Answer with a Dictionary of abstractPC <Integer> to sourceRange <Interval>
	 for compiledCode which may be either a CompiledMethod or a CompiledBlock."
	| rawSourceRanges theMethodToScan |
	abstractSourceRanges ifNotNil:
		[^abstractSourceRanges at: compiledCode].
	abstractSourceRanges := IdentityDictionary new.
	"If the methodNode hasn't had a method generated it doesn't have pcs set in its
	 nodes so we must generate a new method.  We use this method for scanning
	 since its rawSourceRanges refer to the block methods within the method, and
	 that means we can use identity comparisons to match nodes with blocks."
	methodNode rawSourceRangesAndMethodDo:
		[:ranges :method|
		 rawSourceRanges := ranges.
		 theMethodToScan := method].
	self scanMethod: theMethodToScan mappingRanges: rawSourceRanges.
	self mapBlockMethodKeysIn: theMethodToScan toActualBlockMethodsIn: compiledCode homeMethod.
	^abstractSourceRanges at: compiledCode