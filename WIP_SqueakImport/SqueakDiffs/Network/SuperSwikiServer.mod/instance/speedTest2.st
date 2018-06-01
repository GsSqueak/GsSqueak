testing
speedTest2

"SuperSwikiServer testOnlySuperSwiki speedTest2"

"==observed results
10 forks of 10 reads of 88K in 12.7 seconds
100 * 88110 / 12.7 ===> 693779 bytes per second
---
10 forks of 10 reads of 88K in 10.7 seconds
100 * 88110 / 10.7 ===> 823457 bytes per second
---at priority 5
10 forks of 10 reads of 88K in 9.8 seconds
100 * 88110 / 9.8 ===> 899081 bytes per second
==="

	| bigAnswer tRealBegin tRealEnd |

	bigAnswer := SharedQueue new.
	tRealBegin := tRealEnd := Time millisecondClockValue.
	10 timesRepeat: [
		[ | answer |
			answer := SuperSwikiServer testOnlySuperSwiki speedTest1.
			tRealEnd := Time millisecondClockValue.
			bigAnswer nextPut: {
				{tRealBegin. tRealEnd. tRealEnd - tRealBegin}.
				answer
			}.
		] forkAt: Processor userInterruptPriority.
	].
	bigAnswer inspect.
