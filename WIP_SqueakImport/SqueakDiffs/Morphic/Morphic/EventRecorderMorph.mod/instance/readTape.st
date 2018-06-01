fileIn/Out
readTape
	^ self readTape: (UIManager default
							request: 'Tape to read' translated
							initialAnswer: 'tapeName.tape').