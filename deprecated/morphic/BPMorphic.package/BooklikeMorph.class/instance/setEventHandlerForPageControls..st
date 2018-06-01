page controls
setEventHandlerForPageControls: controls 
	"Set the controls' event handler if appropriate. Default is to let the tool
	be dragged by the controls"
	controls
		eventHandler: (EventHandler new
				on: #mouseDown
				send: #move
				to: self)