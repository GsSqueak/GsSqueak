private
setEmphasis
	"Set up the receiver to reflect the emphases in the emphases array.  "

	| selStart selEnd currEmphasis |
	
	labelString := labelString asText.
	emphases isEmptyOrNil ifTrue: [^ self].
	selStart := 1.
	1 to: selections size do:
		[:line |
			selEnd := selStart + (selections at: line) size - 1.
			((currEmphasis := emphases at: line) size > 0 and: [currEmphasis ~~ #normal]) ifTrue:
				[labelString addAttribute: (TextEmphasis perform: currEmphasis)
					from: selStart to: selEnd].
			selStart := selEnd + 2]