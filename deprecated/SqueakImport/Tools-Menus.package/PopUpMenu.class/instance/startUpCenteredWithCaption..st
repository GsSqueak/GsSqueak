basic control sequence
startUpCenteredWithCaption: captionOrNil
	"Differs from startUpWithCaption: by appearing with cursor in the menu,
	and thus ready to act on mouseUp, without requiring user tweak to confirm"
	^ self startUpWithCaption: captionOrNil at: (ActiveHand ifNil:[Sensor]) cursorPoint - (20@0)