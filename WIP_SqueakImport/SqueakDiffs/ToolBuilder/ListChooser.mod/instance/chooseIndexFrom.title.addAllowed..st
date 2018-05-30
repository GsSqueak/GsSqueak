initialize-release
chooseIndexFrom: labelList title: aString addAllowed: aBoolean
	| choice |
	choice := self chooseItemFrom: labelList title: aString addAllowed: false.
	self addAllowed: aBoolean.
	^ self items indexOf: choice