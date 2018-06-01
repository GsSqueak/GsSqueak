midi dispatching
control: control value: newValue
	"Handle a continuous controller change."

	control = 2 ifTrue: [self newVolume: newValue].  "breath controller"
