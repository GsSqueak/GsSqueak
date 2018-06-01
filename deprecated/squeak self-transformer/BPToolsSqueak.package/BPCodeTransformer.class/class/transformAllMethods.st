as yet unclassified
transformAllMethods

	| classes |
	classes := Smalltalk allClasses.
	'Compiling code for every method of every class.'
		displayProgressFrom: 1
		to: classes size
		during: [:classBar |
			classes doWithIndex: [:class :classIndex |
				| methods |
				methods := class methodDict values.
				('Transforming ' , class printString)
					displayProgressFrom: 1
					to: methods size
					during: [:methodBar |
						methods doWithIndex: [:method :methodIndex |
							| source newSource |
							source := method getSource.
							[newSource := self new 
											transformMethod: source
											class: class
											expectsExclamationMark: false.
							class compile: newSource] 
								on: Error
								do: [Transcript showln: '###' , method methodReference].
							methodBar value: methodIndex]].
				classBar value: classIndex]].
							