drawing
drawNullTextOn: aCanvas
	"make null text frame visible"

	aCanvas isPostscriptCanvas ifFalse: [
	aCanvas fillRectangle: bounds color: 
		((Color black) alpha: 0.1).
		]