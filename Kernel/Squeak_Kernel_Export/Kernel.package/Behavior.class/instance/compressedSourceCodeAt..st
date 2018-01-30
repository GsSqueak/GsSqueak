accessing method dictionary
compressedSourceCodeAt: selector
	"(Paragraph compressedSourceCodeAt: #displayLines:affectedRectangle:) size 721 1921
	Paragraph selectors inject: 0 into: [:tot :sel | tot + (Paragraph compressedSourceCodeAt: sel) size] 13606 31450"
	| rawText parse |
	rawText := (self sourceCodeAt: selector) asString.
	parse := self newCompiler parse: rawText in: self notifying: nil.
	^ rawText compressWithTable:
		((selector keywords ,
		parse tempNames ,
		self instVarNames ,
		#(self super ifTrue: ifFalse:) ,
		((0 to: 7) collect:
			[:i | String streamContents:
				[:s | s cr. i timesRepeat: [s tab]]]) ,
		(self compiledMethodAt: selector) literalStrings)
			asSortedCollection: [:a :b | a size > b size])