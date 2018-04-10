fileIn/Out
scanFrom: strm 
	^ self
		toFont: (StrikeFont
				familyName: (strm upTo: $#)
				size: (Number
						readFrom: strm
						ifFail: [0]))