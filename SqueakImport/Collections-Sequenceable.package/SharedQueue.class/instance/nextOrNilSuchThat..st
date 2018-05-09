accessing
nextOrNilSuchThat: aBlock
	"Answer the next object that satisfies aBlock, skipping any intermediate objects.
	If no object has been sent, answer <nil> and leave me intact.
	NOTA BENE:  aBlock MUST NOT contain a non-local return (^)."

	^accessProtect critical: [
		| value readPos |
		value := nil.
		readPos := readPosition.
		[ readPos < writePosition and: [ value isNil ] ] whileTrue: [
			value := contentsArray at: readPos.
			readPos := readPos + 1.
			(aBlock value: value)
				ifFalse: [ value := nil ]
				ifTrue: [
					readSynch waitIfLocked: [ ^nil ]. "We found the value, but someone else booked it."
					readPosition to: readPos - 1 do: [ :j | contentsArray at: j put: nil ].
					readPosition := readPos ] ].
		value ].
"===
q := SharedQueue new.
1 to: 10 do: [ :i | q nextPut: i].
c := OrderedCollection new.
[
	v := q nextOrNilSuchThat: [ :e | e odd].
	v notNil
] whileTrue: [
	c add: {v. q size}
].
{c. q} explore
==="