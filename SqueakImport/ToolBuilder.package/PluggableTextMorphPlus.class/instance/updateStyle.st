styling
updateStyle

	self okToStyle
		ifTrue: [styler styleInBackgroundProcess: textMorph contents].