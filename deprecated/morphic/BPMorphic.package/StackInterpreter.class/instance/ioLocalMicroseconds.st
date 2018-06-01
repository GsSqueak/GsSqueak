primitive support
ioLocalMicroseconds
	^ self ioUTCMicroseconds + (1000000 * DateAndTime localOffset asSeconds)