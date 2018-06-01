tests
testHandlingNotification
	| receivedSignal resumed |
	receivedSignal := resumed := false.
	[ | count |
	"client-code puts up progress, and signals some notications"
	count := 0.
	'doing something'
		displayProgressFrom: 0
		to: 10
		during:
			[ : bar | 10 timesRepeat:
				[ bar value: (count := count + 1).
				(Delay forMilliseconds: 200) wait.
				Notification signal: 'message'.
				resumed := true ] ] ]
		on: Notification
		do:
			[ : noti | receivedSignal := true.
			noti resume ].
	self
		 assert: receivedSignal ;
		 assert: resumed