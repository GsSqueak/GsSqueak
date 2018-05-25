printing
storeOn: aStream
	"Common character literals are preceded by '$', however special need to be encoded differently: for some this might be done by using one of the shortcut constructor methods for the rest we have to create them by ascii-value."

	self shouldBePrintedAsLiteral ifTrue:
		[^self printAsLiteralOn: aStream].
	(self class constantNameFor: self) ifNotNil: [ :name |
		aStream nextPutAll: self class name; space; nextPutAll: name.
		^self ].
	aStream 
		nextPut: $(; nextPutAll: self class name; 
		nextPutAll: ' value: '; print: self asInteger; nextPut: $)
