source mapping
mapBlockMethodKeysIn: theMethodToScan toActualBlockMethodsIn: actualMethod
	abstractSourceRanges at: actualMethod put: (abstractSourceRanges removeKey: theMethodToScan).
	1 to: theMethodToScan numLiterals - 1 do: "i.e. don't scan the last literal which, in CompiledBlocks is a back pointer"
		[:i| | lit |
		 (lit := theMethodToScan literalAt: i) isCompiledCode ifTrue:
			[self mapBlockMethodKeysIn: lit toActualBlockMethodsIn: (actualMethod literalAt: i)]]