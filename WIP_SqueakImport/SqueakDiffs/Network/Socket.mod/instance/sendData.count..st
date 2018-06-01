sending
sendData: buffer count: n
	"Send the amount of data from the given buffer."
	| sent totalSent |
	totalSent := 0.
	[totalSent < n] whileTrue:
		[sent := self sendSomeData: buffer startIndex: totalSent+1 count: n-totalSent.
		 totalSent := totalSent + sent.
		 sent = 0 ifTrue: "If no data was sent don't just sit here spinning hard..."
			[Processor yield]].