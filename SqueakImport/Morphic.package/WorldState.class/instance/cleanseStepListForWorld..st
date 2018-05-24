stepping
cleanseStepListForWorld: aWorld
	"Remove morphs from the step list that are not in this World.  Often were in a flap that has moved on to another world."

	| deletions |
	deletions := nil.
	stepList do: [:entry |
		entry receiver world == aWorld ifFalse: [
			(deletions ifNil: [ deletions := OrderedCollection new ])
				addLast: entry ] ].

	deletions ifNotNil:[
		deletions do: [:entry|
			self stopStepping: entry receiver]].

	self lockAlarmsDuring: [:locked |
		locked alarmsDoSafely: [ :entry |
			| morphToStep |
			morphToStep := entry receiver.
			(morphToStep isMorph and: [morphToStep world == aWorld]) ifFalse: [
				locked removeAlarmWithReceiver: entry receiver selector: entry selector ] ] ]