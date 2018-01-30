example
testDelayOf: delay for: testCount rect: r
	"Delay testDelayOf: 100 for: 20 rect: (10@10 extent: 30@30).
	 Delay testDelayOf: 400 for: 20 rect: (50@10 extent: 30@30)."

	| onDelay offDelay |
	onDelay := Delay forMilliseconds: 50.
	offDelay := Delay forMilliseconds: delay - 50.
	Display fillBlack: r.
	[1 to: testCount do: [:i |
		Display fillWhite: r.
		onDelay wait.
		Display reverse: r.
		offDelay wait].
	] forkAt: Processor userInterruptPriority.
