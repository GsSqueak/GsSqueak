instance creation
new
	^ self on: (String new: 1000)
"
INSTALLING:
TextCollector allInstances do:
	[:t | t breakDependents.
	t become: TranscriptStream new].

TESTING: (Execute this text in a workspace)
Do this first...
	tt := TranscriptStream new.
	tt openLabel: 'Transcript test 1'.
Then this will open a second view -- ooooh...
	tt openLabel: 'Transcript test 2'.
And finally make them do something...
	tt clear.
	[Sensor anyButtonPressed] whileFalse:
		[1 to: 20 do: [:i | tt print: (2 raisedTo: i-1); cr; endEntry]].
"