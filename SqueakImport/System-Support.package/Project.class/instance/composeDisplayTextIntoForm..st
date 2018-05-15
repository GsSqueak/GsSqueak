utilities
composeDisplayTextIntoForm: displayText
	"Compose the given display text into a form. This is at project level so that UI-specific mechanisms can be used. We may want to make this independent from Morphic or MVC in the future. Good-looking text rendering is good for any user interface."
	
	| port form font width height lines |
	font := displayText textStyle defaultFont.
	lines := displayText string lines.
	
	width := lines
		ifEmpty: [1]
		ifNotEmpty: [(lines collect: [:line | font widthOfString: line]) max].
	height := font height * lines size.
	
	form := Form extent: width@height depth: 32.
	port := BitBlt toForm: form.
	
	"1) Fill background."
	port
		fill: form boundingBox
		fillColor: displayText backgroundColor
		rule: Form over.
	
	"2) Draw text lines."
	port combinationRule: Form paint.
	font
		installOn: port
		foregroundColor: displayText foregroundColor
		backgroundColor: Color transparent.
		
	lines withIndexDo: [:line :index |
		font
			displayString: line
			on: port
			from: 1
			to: line size
			at: 0@((index-1) * font height)
			kern: 0].
	
	^ form