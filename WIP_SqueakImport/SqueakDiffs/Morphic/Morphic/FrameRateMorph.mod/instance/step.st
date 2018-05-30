stepping and presenter
step
	"Compute and display (every half second or so) the current framerate"

	| now mSecs mSecsPerFrame framesPerSec newContents |
	framesSinceLastDisplay := framesSinceLastDisplay + 1.
	now := Time millisecondClockValue.
	mSecs := now - lastDisplayTime.
	(mSecs > 500 or: [mSecs < 0 "clock wrap-around"]) ifTrue: 
		[mSecsPerFrame := mSecs // framesSinceLastDisplay.
		framesPerSec := (framesSinceLastDisplay * 1000) // mSecs.
		newContents := mSecsPerFrame printString, ' mSecs (', framesPerSec printString, ' frame', (framesPerSec = 1 ifTrue: [''] ifFalse: ['s']), '/sec)'.
		self contents: newContents.
		lastDisplayTime := now.
		framesSinceLastDisplay := 0]