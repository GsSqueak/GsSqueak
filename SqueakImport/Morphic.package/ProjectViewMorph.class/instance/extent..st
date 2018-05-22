geometry
extent: aPoint
	"Set my image form to the given extent."

	| newExtent scaleP scale |

	((bounds extent = aPoint) and: [image depth = Display depth]) ifFalse: [
		lastProjectThumbnail ifNil: [ lastProjectThumbnail := image ].
		scaleP := aPoint / lastProjectThumbnail extent.
		scale := scaleP "scaleP x asFloat max: scaleP y asFloat".
		newExtent := (lastProjectThumbnail extent * scale) rounded.
		self image: (Form extent: newExtent depth: Display depth).
		self updateImageFrom: lastProjectThumbnail.
	].
	self updateNamePosition.