accessing
= anOtherUser
	"Equal means, that my instance variables contain the same values as the other object variables."

	|instVarNumber|
	
	anOtherUser class == self class ifFalse: [^false].
	instVarNumber := self class instSize.
	
	^((1 to: instVarNumber) collect: [:i | self instVarAt: i]) = ((1 to:  instVarNumber) collect: [:i | anOtherUser instVarAt: i])