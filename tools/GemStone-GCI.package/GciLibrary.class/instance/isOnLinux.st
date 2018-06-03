platform support
isOnLinux

	^ Smalltalk os platformName = 'unix' and: [Smalltalk osVersion beginsWith: 'linux']