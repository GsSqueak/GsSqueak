benchmarks
tinyBenchmarks
	"Report the results of running the two tiny Squeak benchmarks.
	ar 9/10/1999: Adjusted to run at least 1 sec to get more stable results"
	"0 tinyBenchmarks"
	"On a 292 MHz G3 Mac: 23,000,000 bytecodes/sec; 980,000 sends/sec"
	"On a 400 MHz PII/Win98:  18,000,000 bytecodes/sec; 1,100,000 sends/sec"
	"On a 2800 MHz i7:  1,200,000,000 bytecodes/sec; 25,000,000 sends/sec"
	"On a 2800 MHz i7 (CogVM):  1,700,000,000 bytecodes/sec; 260,000,000 sends/sec"	
	| t1 t2 r n1 n2 |
	n1 := 1.
	[t1 := Time millisecondsToRun: [n1 benchmark].
	t1 < 1000] whileTrue:[n1 := n1 * 2]. "Note: #benchmark's runtime is about O(n)"

	n2 := 28.
	[t2 := Time millisecondsToRun: [r := n2 benchFib].
	t2 < 1000] whileTrue:[n2 := n2 + 1]. 
	"Note: #benchFib's runtime is about O(k^n),
		where k is the golden number = (1 + 5 sqrt) / 2 = 1.618...."

	^ ((n1 * 500000 * 1000) // t1 significantDigits: 2) asStringWithCommas, ' bytecodes/sec; ',
	  ((r * 1000) // t2 significantDigits: 2) asStringWithCommas, ' sends/sec'
