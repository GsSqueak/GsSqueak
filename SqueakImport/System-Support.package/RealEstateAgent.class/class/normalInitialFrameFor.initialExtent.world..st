framing - private
normalInitialFrameFor: aView initialExtent: initialExtent world: aWorld
	"Find a plausible initial screen area for the supplied view, which should be a StandardSystemView, taking into account the 'reverseWindowStagger' Preference, the size needed, and other windows currently on the screen."

	| allOrigins screenRight screenBottom putativeOrigin putativeFrame allowedArea staggerOrigin otherFrames |

	allowedArea := self maximumUsableAreaInWorld: aWorld.
	screenRight := allowedArea right.
	screenBottom := allowedArea bottom.

	otherFrames := Smalltalk isMorphic
		ifTrue: [(SystemWindow windowsIn: aWorld satisfying: [:w | w isCollapsed not])
					collect: [:w | w bounds]]
		ifFalse: [ScheduledControllers scheduledWindowControllers
				select: [:aController | aController view ~~ nil]
				thenCollect: [:aController | aController view isCollapsed
								ifTrue: [aController view expandedFrame]
								ifFalse: [aController view displayBox]]].

	allOrigins := otherFrames collect: [:f | f origin].
	(self standardPositionsInWorld: aWorld) do:  "First see if one of the standard positions is free"
		[:aPosition | (allOrigins includes: aPosition)
			ifFalse:
				[^ (aPosition extent: initialExtent) translatedAndSquishedToBeWithin: allowedArea]].

	staggerOrigin := (self standardPositionsInWorld: aWorld) first.  "Fallback: try offsetting from top left"
	putativeOrigin := staggerOrigin.

	[putativeOrigin := putativeOrigin + StaggerOffset.
	putativeFrame := putativeOrigin extent: initialExtent.
	(putativeFrame bottom < screenBottom) and:
					[putativeFrame right < screenRight]]
				whileTrue:
					[(allOrigins includes: putativeOrigin)
						ifFalse:
							[^ (putativeOrigin extent: initialExtent) translatedAndSquishedToBeWithin: allowedArea]].
	^ (self scrollBarSetback @ self screenTopSetback extent: initialExtent) translatedAndSquishedToBeWithin: allowedArea