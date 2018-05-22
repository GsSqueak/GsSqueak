*Morphic-Balloon
addFillStyleMenuItems: aMenu hand: aHand from: aMorph
	"Add the items for changing the current fill style of the receiver"
	self isRadialFill ifTrue:[
		aMenu add: 'linear gradient' translated target: self selector: #beLinearGradientIn: argument: aMorph.
	] ifFalse:[
		aMenu add: 'radial gradient' translated target: self selector: #beRadialGradientIn: argument: aMorph.
	].
	aMenu addLine.
	aMenu add: 'change color ramp' translated target: self selector: #changeColorRampIn:event: argument: aMorph.
	aMenu addLine.
	super addFillStyleMenuItems: aMenu hand: aHand from: aMorph.