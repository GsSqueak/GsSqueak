model access
models
	"Answer a collection of whatever models I may have."
	^ self modelOrNil
		ifNil: [ Array empty ]
		ifNotNil: [ Array with: self modelOrNil ]