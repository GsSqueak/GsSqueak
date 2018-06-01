preferences
placeWindowsAtPointer
	"Value of the place-windows-at-pointer preference."
	<preference: 'Place Windows At Pointer'
		category: 'windows'
		description: 'When true, place new windows near the mouse pointer'
		type: #Boolean>
	^PlaceWindowsAtPointer ifNil: [false]