private
preferenceChanged: aBoolean 
	"Take immediate effect for all in a  World."
	self allInstances do:
		[ : each | (each isInWorld and: [ aBoolean and: [ each wantsSteps ] ])
			ifTrue: [ each startStepping ]
			ifFalse: [ each stopStepping ] ]