devkit path
validDevkitPath

	^ self devkitPath notEmpty and: [self devkitPathDirectory exists]