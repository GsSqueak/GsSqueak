public
declToType: decl
	"Extracts the type from a C declaration string"

	| strs r |
	decl isNil ifFalse: [
		(decl indexOf: $=) > 0 ifTrue:
			[ strs := (decl copyFrom: 1 to: ((decl indexOf: $=) - 1)) ]
		ifFalse: [ strs := decl ].
		strs := (strs withoutTrailingBlanks) subStrings: ' '.
		strs size == 1 ifTrue: [ ^ strs first ]
			ifFalse:
		[
			| asterisks |
			r := ''.
			strs allButLastDo: [ :s | r := r,s,' ' ].
			"Bit of a hack to get 'type *'"
			asterisks := (strs last copyFrom: 1 to: (strs last lastIndexOf: $*)).
			asterisks size > 0 ifTrue: [ r := r,' ',asterisks ].
			r := r withoutTrailingBlanks.
			(((r indexOf: $() > 0) or: ((r indexOf: $)) > 0)) ifTrue: [ ^nil ].
			^r withoutTrailingBlanks
		].
	] ifTrue: [ ^nil ].