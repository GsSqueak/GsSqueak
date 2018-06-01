halos and balloon help
wantsHalo
	| topOwner |
	^(topOwner := self topRendererOrSelf owner) notNil 
		and: [topOwner wantsHaloFor: self]