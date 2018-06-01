initialization
initialize
	"initialize the state of the receiver"

	super initialize.
	self useRoundedCorners.
	pageHolder useRoundedCorners; borderWidth: 0;
		color: (self
				gridFormOrigin: 0 @ 0
				grid: ScriptingSystem sorterGridSize
				background: Color white
				line: Color blue muchLighter)