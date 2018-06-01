accessing
icon
	"Answer a form to be used as icon"
	^ item iconOrThumbnailOfSize: ((Preferences tinyDisplay ifTrue: [16] ifFalse: [28]))