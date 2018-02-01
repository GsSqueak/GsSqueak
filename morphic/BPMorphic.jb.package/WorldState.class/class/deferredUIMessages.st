class initialization
deferredUIMessages
<<<<<<< HEAD
	^ DeferredUIMessages
		ifNil: [DeferredUIMessages := SharedQueue new]
=======
  ^ DeferredUIMessages ifNil: [ DeferredUIMessages := TransientSharedQueue new ]
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
