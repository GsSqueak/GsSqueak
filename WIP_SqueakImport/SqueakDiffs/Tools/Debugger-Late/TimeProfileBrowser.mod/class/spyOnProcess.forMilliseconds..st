instance creation
spyOnProcess: aProcess forMilliseconds: msecDuration 
	"Run aProcess for msecDuration milliseconds, then open a TimeProfileBrowser on the results."

	"| p |  
	p := [100000 timesRepeat: [3.14159 printString]] fork.  
	(Delay forMilliseconds: 100) wait.  
	TimeProfileBrowser spyOnProcess: p forMilliseconds: 1000"

	| inst |
	inst := self new.
	inst runProcess: aProcess forMilliseconds: msecDuration pollingEvery: MessageTally defaultPollPeriod.
	self open: inst name: (String streamContents: [ :s | s nextPutAll: 'Time Profile for '; print: msecDuration; nextPutAll: ' msec' ]).
	^ inst