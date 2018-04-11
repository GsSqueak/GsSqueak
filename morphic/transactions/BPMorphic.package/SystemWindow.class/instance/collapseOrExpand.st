resize/collapse
collapseOrExpand
	"Collapse or expand the window, depending on existing state"
	| _gsSqueakTemp_cf |
	isCollapsed
		ifTrue: ["Expand -- restore panes to morphics structure"
			isCollapsed := false.
			self beKeyWindow.
			"Bring to frint first"
			Preferences collapseWindowsInPlace
				ifTrue: [fullFrame := fullFrame align: fullFrame topLeft with: self getBoundsWithFlex topLeft]
				ifFalse: [collapsedFrame := self getBoundsWithFlex].
			collapseBox
				ifNotNil: [collapseBox setBalloonText: 'collapse this window' translated].
			self setBoundsWithFlex: fullFrame.
			paneMorphs
				reverseDo: [:m | 
					self addMorph: m unlock.
					self world startSteppingSubmorphsOf: m].
			self addPaneSplitters.
			(self hasProperty: #applyTheme)
				ifTrue: [self removeProperty: #applyTheme.
					self userInterfaceTheme applyTo: self allMorphs]]
		ifFalse: ["Collapse -- remove panes from morphics structure"
			isCollapsed := true.
			fullFrame := self getBoundsWithFlex.
			"First save latest fullFrame"
			paneMorphs
				do: [:m | m delete; releaseCachedState].
			self removePaneSplitters.
			self removeCornerGrips.
			model modelSleep.
			_gsSqueakTemp_cf := self getCollapsedFrame.
			(collapsedFrame isNil
					and: [Preferences collapseWindowsInPlace not])
				ifTrue: [collapsedFrame := _gsSqueakTemp_cf].
			self setBoundsWithFlex: _gsSqueakTemp_cf.
			collapseBox
				ifNotNil: [collapseBox setBalloonText: 'expand this window' translated].
			expandBox
				ifNotNil: [expandBox setBalloonText: 'expand this window' translated].
			self sendToBack].
	self layoutChanged