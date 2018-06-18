instance creation
new: length neg: neg
	"Answer an instance of a large integer whose size is length. neg is a flag 
	determining whether the integer is negative or not."
	| lint |
	lint := LargeInteger new: length.
	neg 
		ifTrue: [^ lint _env0 _digitAt: 0 put: 1]
		ifFalse: [^ lint]
