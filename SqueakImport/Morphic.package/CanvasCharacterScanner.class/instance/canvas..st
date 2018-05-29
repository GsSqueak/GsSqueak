accessing
canvas: aCanvas
	"set the canvas to draw on"
	canvas ifNotNil: [ self inform: 'initializing twice!' ].
	canvas := aCanvas