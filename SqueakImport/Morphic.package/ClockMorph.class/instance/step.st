stepping and presenter
step

	| time |
	super step.
	time := String streamContents: [ :stream |
		| t |
		t := Time now.
		t seconds: t asSeconds. "ignore nanoSeconds"
		t 
			print24: (show24hr == true)
			showSeconds: (showSeconds == true)
			on: stream].
	self contents: time