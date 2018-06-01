import/export
importIconNamed: aString
	"self importIconNamed: 'appearanceIcon'"
	"will create a method appearanceIconContents holding the string representation of the
	icon, and a method appearanceIcon to access a form built using that string"
	
	| writer image stream |
	writer := GIFReadWriter on: (FileStream fileNamed: './icons/', aString, '.gif').
	image := [ writer nextImage]	
		ensure: [writer close].
	"store string representation"
	stream := String new writeStream.
	stream nextPutAll: aString, 'Contents' ; cr.
	stream nextPutAll: (self methodStart: aString).
	image storeOn: stream.
	stream nextPutAll: self methodEnd.
	MenuIcons class compile: stream contents classified: 'private - icons' notifying: nil.
	"create accessor method"
	stream := String new writeStream.
	stream nextPutAll: aString ; cr.
	stream nextPutAll: (self methodAccessorFor: aString).
	MenuIcons class compile: stream contents classified: 'accessing - icons' notifying: nil.
	^ stream contents