primitive support
ioLocalMicrosecondsNow
	^ self ioUTCMicrosecondsNow + (1000000 * DateAndTime localOffset asSeconds)