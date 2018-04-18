accessing
at: key ifAbsent: aBlock 
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."

	^((array at: (self scanFor: key)) ifNil: [ aBlock ]) value "Blocks and Associations expect #value"