fileIn/Out
scanFrom: strm
	^strm next
		caseOf: {
			[ $b ] -> [ self bold ] .	
			[ $i ] -> [ self italic ] .	
			[ $u ] -> [ self underlined ] .	
			[ $= ] -> [ self struckOut ] .	
			[ $n ] -> [ self normal ]
		}
		otherwise: [self error: 'unrecognized identifier ']