utilities
createViewIfAppropriate
	"Create a project view for the receiver and place it appropriately on the screen."

	| aMorph requiredWidth existing proposedV proposedH despair |
	ProjectViewOpenNotification signal ifTrue:
		[Preferences projectViewsInWindows
			ifTrue:
				[(ProjectViewMorph newProjectViewInAWindowFor: self) openInWorld]
			ifFalse:
				[aMorph := ProjectViewMorph on: self.
				requiredWidth := aMorph width + 10.
				existing := ActiveWorld submorphs
					select: [:m | m isKindOf: ProjectViewMorph]
					thenCollect: [:m | m fullBoundsInWorld].
				proposedV := 85.
				proposedH := 10.
				despair := false.
				[despair not and: [((proposedH @ proposedV) extent: requiredWidth) intersectsAny: existing]] whileTrue:
					[proposedH := proposedH + requiredWidth.
					proposedH + requiredWidth > ActiveWorld right ifTrue:
						[proposedH := 10.
						proposedV := proposedV + 90.
						proposedV > (ActiveWorld bottom - 90)
							ifTrue:
								[proposedH := ActiveWorld center x - 45.
								proposedV := ActiveWorld center y - 30.
								despair := true]]].
				aMorph position: (proposedH @ proposedV).
				aMorph openInWorld]]