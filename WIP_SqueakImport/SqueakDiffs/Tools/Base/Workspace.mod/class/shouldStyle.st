preferences
shouldStyle
	<preference: 'Shout styling in Workspace' 
		category: 'browsing' 
		description: 'If true, new workspaces use Shout to style their contents.' 
		type: #Boolean>
	^ ShouldStyle ifNil: [ false ]