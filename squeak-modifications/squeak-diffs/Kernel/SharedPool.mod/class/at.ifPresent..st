accessing
at: key ifPresent: aBlock
    | v |
	v := self at: key ifAbsent: [^ nil].
	^ aBlock value: v
