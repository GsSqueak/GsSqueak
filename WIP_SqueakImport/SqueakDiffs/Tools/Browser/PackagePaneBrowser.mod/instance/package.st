package list
package
	"Answer the receiver's 'package'."

	^ self hasPackageSelected
		ifFalse: [nil]
		ifTrue: [self packageList at: packageListIndex]
