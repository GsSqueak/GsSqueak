menu
addCustomMenuItems: aMenu hand: aHandMorph
	"Add morph-specific items to the given menu which was invoked by the given hand.  This method provides is invoked both from the halo-menu and from the control-menu regimes."

	super addCustomMenuItems: aMenu hand: aHandMorph.
	aMenu addUpdating: #handlesShowingPhrase target: self action: #showOrHideHandles.
	vertices size > 2 ifTrue:
		[aMenu addUpdating: #openOrClosePhrase target: self action: #makeOpenOrClosed].

	aMenu addUpdating: #smoothPhrase target: self action: #toggleSmoothing.
	aMenu addLine.
	aMenu add: 'specify dashed line' translated action:  #specifyDashedLine.

	self isOpen ifTrue:
		[aMenu addLine.
		aMenu addWithLabel: '---' enablement: [self isOpen and: [arrows ~~ #none]] action:  #makeNoArrows.
		aMenu addWithLabel: '-->' enablement: [self isOpen and: [arrows ~~ #forward]] action:  #makeForwardArrow.
		aMenu addWithLabel: '<--' enablement: [self isOpen and: [arrows ~~ #back]] action:  #makeBackArrow.
		aMenu addWithLabel: '<->' enablement: [self isOpen and: [arrows ~~ #both]] action:  #makeBothArrows.
		aMenu add: 'customize arrows' translated action: #customizeArrows:.
		(self hasProperty: #arrowSpec)
			ifTrue: [aMenu add: 'standard arrows' translated action: #standardArrows]].