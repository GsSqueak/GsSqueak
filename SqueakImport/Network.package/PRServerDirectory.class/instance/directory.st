accessing
directory
	"answer the receiver's directory"
	| result |
	result := String new writeStream.
	self directories
		do: [:each | result nextPutAll: each]
		separatedBy: [result nextPutAll: self slash].
	^ result contents