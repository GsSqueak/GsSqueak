resize handling
linkSubmorphsToSplitters
	self splitters
		do: [:splitter | 
			splitter splitsTopAndBottom
				ifTrue: [self
						submorphsDo: [:morph | 
							((morph ~= splitter
										and: [morph layoutFrame bottomFraction = splitter layoutFrame topFraction])
									and: [morph layoutFrame hasFixedHeight not
											or: [(morph layoutFrame topOffset
													ifNil: [0])
													< 0]])
								ifTrue: [splitter addLeftOrTop: morph].
							((morph ~= splitter
										and: [morph layoutFrame topFraction = splitter layoutFrame bottomFraction])
									and: [morph layoutFrame hasFixedHeight not
											or: [(morph layoutFrame bottomOffset
													ifNil: [0])
													> 0]])
								ifTrue: [splitter addRightOrBottom: morph]]].
			splitter splitsLeftAndRight
				ifTrue: [self
						submorphsDo: [:morph | 
							((morph ~= splitter
										and: [morph layoutFrame rightFraction = splitter layoutFrame leftFraction])
									and: [morph layoutFrame hasFixedWidth not
											or: [(morph layoutFrame leftOffset
													ifNil: [0])
													< 0]])
								ifTrue: [splitter addLeftOrTop: morph].
							((morph ~= splitter
										and: [morph layoutFrame leftFraction = splitter layoutFrame rightFraction])
									and: [morph layoutFrame hasFixedWidth not
											or: [(morph layoutFrame rightOffset
													ifNil: [0])
													> 0]])
								ifTrue: [splitter addRightOrBottom: morph]]]]