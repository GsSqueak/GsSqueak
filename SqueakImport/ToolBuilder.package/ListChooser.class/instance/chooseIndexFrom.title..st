initialize-release
chooseIndexFrom: labelList title: aString
	| choice |
	choice := self chooseItemFrom: labelList title: aString addAllowed: false.
	^ self items indexOf: choice