miscellaneous
steplistToolsWorkspace
	^ ((StringHolder new contents:  'self currentWorld listOfSteppingMorphs asArray inspectWithLabel: ''stepping morphs''.
Utilities cleanseOtherworldlySteppers.
self currentWorld steppingMorphsNotInWorld do: [:m | m delete].
self currentWorld stepListSummary.
self currentWorld stepListSize.
self currentHand attachMorph: FrameRateMorph new') openLabel: 'Steplist workspace')

setWindowColor: (Color r: 0.9 g: 0.7 b: 0.5);
			openInWorld: self currentWorld extent: (550 @ 140)

"Utilities steplistToolsWorkspace"