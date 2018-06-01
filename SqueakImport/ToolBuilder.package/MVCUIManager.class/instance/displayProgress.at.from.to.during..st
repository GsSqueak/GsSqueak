ui requests
displayProgress: titleString at: aPoint from: minVal to: maxVal during: workBlock
	"Display titleString as a caption over a progress bar while workBlock is evaluated."
	| delta savedArea captionText textFrame barFrame outerFrame result range lastW |
	barFrame := aPoint - (75@10) corner: aPoint + (75@10).
	captionText := DisplayText text: titleString asText allBold.
	captionText
		foregroundColor: Color black
		backgroundColor: Color white.
	textFrame := captionText boundingBox insetBy: -4.
	textFrame := textFrame align: textFrame bottomCenter
					with: barFrame topCenter + (0@2).
	outerFrame := barFrame merge: textFrame.
	delta := outerFrame amountToTranslateWithin: Display boundingBox.
	barFrame := barFrame translateBy: delta.
	textFrame := textFrame translateBy: delta.
	outerFrame := outerFrame translateBy: delta.
	savedArea := Form fromDisplay: outerFrame.
	Display fillBlack: barFrame; fillWhite: (barFrame insetBy: 2).
	Display fillBlack: textFrame; fillWhite: (textFrame insetBy: 2).
	captionText displayOn: Display at: textFrame topLeft + (4@4).
	range := maxVal = minVal ifTrue: [1] ifFalse: [maxVal - minVal].  "Avoid div by 0"
	lastW := 0.
	[result := workBlock value:  "Supply the bar-update block for evaluation in the work block"
		[:barVal |
		| w |
		w := ((barFrame width-4) asFloat * ((barVal-minVal) asFloat / range min: 1.0)) asInteger.
		w ~= lastW ifTrue: [
			Display fillGray: (barFrame topLeft + (2@2) extent: w@16).
			lastW := w]]]
		ensure: [savedArea displayOn: Display at: outerFrame topLeft].
	^result