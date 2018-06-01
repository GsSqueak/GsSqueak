closure analysis
addHoistedTemps: additionalTemporaries 
	"<SequenceableCollection>"
	| tempsToBeMerged additionalTempsToAdd |
	additionalTemporaries
		do: [:temp | temp definingScope
				ifNil: [temp definingScope: self]].
	(temporaries isNil
			or: [temporaries isEmpty])
		ifTrue: [temporaries := additionalTemporaries copy.
			^ self].
	tempsToBeMerged := additionalTemporaries
				select: [:t | t isBlockArg
						and: [temporaries
								anySatisfy: [:existing | existing isBlockArg
										and: [existing key = t key]]]].
	additionalTempsToAdd := tempsToBeMerged isEmpty
				ifTrue: [additionalTemporaries copy]
				ifFalse: [additionalTemporaries
						reject: [:temp | tempsToBeMerged identityIncludes: temp]].
	temporaries := (temporaries isNil
					or: [temporaries isEmpty])
				ifTrue: [additionalTempsToAdd]
				ifFalse: [temporaries last isIndirectTempVector
						ifTrue: [temporaries allButLast , additionalTempsToAdd , {temporaries last}]
						ifFalse: [temporaries , additionalTempsToAdd]].
	tempsToBeMerged
		do: [:t | 
			| merge |
			merge := temporaries
						detect: [:existing | existing isBlockArg
								and: [existing key = t key]].
			merge absorbHoistedTemp: t]