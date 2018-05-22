*GsSqueak
at: key ifPresentPut: aBlock

	^ self at: key ifPresent: [:oldValue | self at: key put: aBlock value]