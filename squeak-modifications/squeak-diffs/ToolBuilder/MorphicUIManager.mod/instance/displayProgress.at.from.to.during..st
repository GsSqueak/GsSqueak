ui requests
displayProgress: titleString at: aPoint from: minVal to: maxVal during: workBlock 
	"Display titleString as a caption over a progress bar while workBlock is evaluated."
	| result progress |
	progress := SystemProgressMorph
		position: aPoint
		label: titleString
		min: minVal
		max: maxVal.
	[ [ result := workBlock value: progress ]
		on: ProgressNotification
		do:
			[ : ex | ex extraParam isString ifTrue:
				[ SystemProgressMorph uniqueInstance
					labelAt: progress
					put: ex extraParam ].
			ex resume ] ] ensure: [ SystemProgressMorph close: progress ].
	^ result