halos and balloon help
wantsHaloFor: aSubMorph
	"Answer whether the receiver wishes for a mouse-over halo to be produced for aSubMorph"

	^ wantsMouseOverHalos == true and:
		 [self visible and:
			[isPartsBin ~~ true and:
				[self dropEnabled and:
					[aSubMorph renderedMorph isLikelyRecipientForMouseOverHalos]]]]