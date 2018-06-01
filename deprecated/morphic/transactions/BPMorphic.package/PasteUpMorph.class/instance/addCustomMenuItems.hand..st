menu & halo
addCustomMenuItems: menu hand: aHandMorph 
	"Add morph-specific menu itemns to the menu for the hand"
	super addCustomMenuItems: menu hand: aHandMorph.
	menu addLine.
	Preferences noviceMode
		ifFalse: [self addStackMenuItems: menu hand: aHandMorph.
			self addPenMenuItems: menu hand: aHandMorph.
			self addPlayfieldMenuItems: menu hand: aHandMorph].
	self isWorldMorph
		ifTrue: [menu addLine.
			Preferences noviceMode
				ifFalse: [(owner isKindOf: BOBTransformationMorph)
						ifTrue: [self addScalingMenuItems: menu hand: aHandMorph]].
			menu addUpdating: #showWorldMainDockingBarString action: #toggleShowWorldMainDockingBar.
			Flaps sharedFlapsAllowed
				ifTrue: [menu
						addUpdating: #suppressFlapsString
						target: Project current
						action: #toggleFlapsSuppressed].
			Preferences noviceMode
				ifFalse: [| twm |
					menu addLine.
					twm := TheWorldMenu new.
					twm
						world: self
						project: Project current
						hand: aHandMorph.
					menu add: 'old desktop menu... (W)' translated subMenu: twm buildWorldMenu]]