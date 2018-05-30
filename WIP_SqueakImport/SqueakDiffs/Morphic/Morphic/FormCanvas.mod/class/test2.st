testing
test2
	"FormCanvas test2"

	| baseCanvas p |
	baseCanvas := FormCanvas extent: 200@200.
	p := Sensor cursorPoint.
	[Sensor anyButtonPressed] whileFalse: [
		baseCanvas translateBy: (Sensor cursorPoint - p) during:[:canvas|
			canvas fillColor: Color white.
			canvas line: 10@10 to: 50@30 width: 1 color: Color red.
			canvas frameRectangle: ((20@20) corner: (120@120)) width: 4 color: Color green.
			canvas point: 100@100 color: Color black.
			canvas drawString: 'Hello, World!' at: 40@40 font: nil color: Color cyan.
			canvas fillRectangle: ((10@80) corner: (31@121)) color: Color magenta.
			canvas fillOval: ((10@80) corner: (31@121)) color: Color cyan.
			canvas frameOval: ((40@80) corner: (61@121)) color: Color blue.
			canvas frameOval: ((70@80) corner: (91@121)) width: 3 color: Color red.
			canvas fillRectangle: ((130@30) corner: (170@80)) color: Color lightYellow.
			canvas showAt: 0@0]].
