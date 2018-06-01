construction
curveChoices
	| extant others |
	extant := sound envelopes collect: [:env | env name].
	others := #('volume' 'modulation' 'pitch' 'random pitch:' 'ratio')
		reject: [:x | (extant includes: x) | ((x = 'pitch') & (extant includes: 'random pitch:')) | ((x = 'random pitch:') & (extant includes: 'pitch')) ].
	^ (extant collect: [:name | 'edit ' , name])
	, (others collect: [:name | 'add ' , name])
	, (sound envelopes size > 1
		ifTrue: [Array with: 'remove ' , envelope name]
		ifFalse: [Array new])