*Morphic-Etoys-customevents-help dictionary
statusHelpStringFor: aPlayer
	^String streamContents: [ :stream |
		stream nextPutAll: 'normal -- run when called
paused -- ready to run all the time
ticking -- run all the time
mouseDown -- run when mouse goes down on me
mouseStillDown -- while mouse still down
mouseUp -- when mouse comes back up
mouseEnter -- when mouse enters my bounds, button up
mouseLeave -- when mouse exits my bounds, button up
mouseEnterDragging -- when mouse enters my bounds, button down
mouseLeaveDragging -- when mouse exits my bounds, button down
opening -- when I am being opened
closing -- when I am being closed' translated.

"'keyStroke -- run when user hits a key' "

	stream cr; cr; nextPutAll: 'More events:' translated; cr.

	(self customEventNamesAndHelpStringsFor: aPlayer) do: [ :array |
		stream cr;
		nextPutAll: array first;
		nextPutAll: ' -- '.
		array second do: [ :help | stream nextPutAll: help translated ]
			separatedBy: [ stream nextPutAll: ' or ' translated ]].

	(Preferences valueOfFlag: #allowEtoyUserCustomEvents) ifTrue: [
	self userCustomEventNames isEmpty ifFalse: [
		stream cr; cr; nextPutAll: 'User custom events:' translated; cr.
		self currentWorld userCustomEventsRegistry keysAndValuesDo: [ :key :value |
			stream cr; nextPutAll: key; nextPutAll: ' -- '; nextPutAll: value ]]]]