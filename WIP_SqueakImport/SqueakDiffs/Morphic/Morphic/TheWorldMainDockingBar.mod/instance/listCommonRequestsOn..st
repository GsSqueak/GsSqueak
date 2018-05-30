submenu - do
listCommonRequestsOn: aMenu

	| strings |
	strings := Utilities commonRequestStrings contents.

	strings asString linesDo: [:aString |
		aString = '-'
			ifTrue: [aMenu addLine]
			ifFalse: [aMenu add: (aString ifEmpty: [' ']) target: Utilities selector: #eval: argument: aString]].

	aMenu addLine.
	aMenu add: 'edit this list' translated target: Utilities action: #editCommonRequestStrings.