converting
squeakToUtf8
	"Convert the receiver into a UTF8-encoded string"
	
	^self convertToWithConverter: UTF8TextConverter new.