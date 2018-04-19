*SqCollectionLiterals-*SqCollectionLiterals-converting
asOctetString
	"Convert the receiver into an octet string"
	| string |
	string := String new: self size.
	1 to: self size do: [:i | string at: i put: (self at: i)].
	^string
