testing
speedTest1

"SuperSwikiServer testOnlySuperSwiki speedTest1"

	| totalTime answer |

	totalTime := [
		answer := (1 to: 10) collect: [ :x | | t |
			t := [answer := self sendToSwikiProjectServer: {
				'action: readnamedfile'.
				'projectname: xyz.002.pr'.
			}] timeToRun.
			{t. answer size}
		].
	] timeToRun.
	^{totalTime. answer}
