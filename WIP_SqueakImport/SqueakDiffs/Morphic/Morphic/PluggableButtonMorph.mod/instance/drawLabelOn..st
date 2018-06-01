drawing
drawLabelOn: aCanvas

	| fontToUse labelToUse colorToUse labelWidth layoutBounds drawBlock |
	self label ifNil: [^ self].

	layoutBounds := self layoutBounds.
	labelToUse := self label asString.
	fontToUse := self font.
	colorToUse := self textColorToUse.
	
	"Support very narrow buttons. Shrink text to monogram then."
	((layoutBounds width < self labelShrinkThreshold
		and: [self hResizing ~~ #shrinkWrap])
		and: [labelToUse size > 3]) ifTrue: [
			labelToUse := labelToUse first asString. "Show first character only."
			fontToUse := fontToUse emphasized: (TextEmphasis bold) emphasisCode].
	
	labelWidth := fontToUse widthOfString: labelToUse.

	drawBlock := [:c | c
			drawString: labelToUse
			at: (layoutBounds center x - (labelWidth // 2) max: (layoutBounds left)) 
				@ (layoutBounds center y - (fontToUse height // 2))
			font: fontToUse
			color: colorToUse].
		
	self clipSubmorphs
		ifTrue: [aCanvas clipBy: layoutBounds during: drawBlock]
		ifFalse: [drawBlock value: aCanvas]