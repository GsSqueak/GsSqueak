*SqCollectionLiterals-*SqCollectionLiterals-converting
utf8ToSqueak
	"Convert the receiver from a UTF8-encoded string"
	
	^self convertFromWithConverter: UTF8TextConverter new.
