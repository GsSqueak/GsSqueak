A MultiWindowLabelButtonMorph is  a means of implementing tabbed windows.  It cooperates with PluggableSystemWindowWithButton to provide a drop-down menu of windows when clicking in the window label.  It requires the model to create a suitable sub-instance of SavedMultiWindowState for inactive windows.  To specify multi-windows use the multiWindowStyle: setter to customize a PluggableWindowSpec.

Instance Variables
	savedMultiWindowState:		<SavedMultiWindowState>

savedMultiWindowState
	- the sequence of models in a multi-window.