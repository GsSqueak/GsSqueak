scaling
yFromValue: val
	"The convention is that envelope values are between 0.0 and 1.0"
	^ graphArea bottom - (val* (graphArea height))