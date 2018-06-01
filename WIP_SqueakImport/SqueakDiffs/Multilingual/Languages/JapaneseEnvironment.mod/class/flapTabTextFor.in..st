language methods
flapTabTextFor: aString in: aFlapTab

	| string |
	string := super flapTabTextFor: aString.
	string isEmptyOrNil ifTrue: [^ self].
	string := aFlapTab orientation == #vertical
				ifTrue: [string copyReplaceAll: 'ー' with: '｜']
				ifFalse: [string copyReplaceAll: '｜' with: 'ー'].

	^ string.
