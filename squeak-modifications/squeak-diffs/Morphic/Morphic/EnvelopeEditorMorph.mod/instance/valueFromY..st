scaling
valueFromY: y
	"The convention is that envelope values are between 0.0 and 1.0"
	| value |
	value := (graphArea bottom - y) asFloat / (graphArea height).
	envelope updateSelector = #ratio: ifTrue:
		["Ratio gets gridded by denominator"
		^ (value * envelope scale * denominator) rounded asFloat / denominator / envelope scale].
	^ value