class initialization
nonAtomSet
	"(from RFC 6531)"

	^CSNonAtom ifNil: [ | notAtoms | 
		notAtoms := CharacterSet new
			addAll: ($A to: $Z);
			addAll: ($a to: $z);
			addAll: ($0 to: $9);
			addAll: '!#$%&''*+-/=?^_`{|}~';
			complement.
		CSNonAtom := Set new.
		0 to: 127 do: [:v | | c |
			c := Character value: v.
			(notAtoms includes: c) ifTrue: [CSNonAtom add: c]]]