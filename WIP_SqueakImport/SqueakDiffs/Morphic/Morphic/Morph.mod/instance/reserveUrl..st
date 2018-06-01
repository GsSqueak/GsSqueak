fileIn/out
reserveUrl: urlString
	"Write a dummy object to the server to hold a name and place for this object."

	| dummy ext str |
	dummy := PasteUpMorph new.
	dummy borderWidth: 2.
	dummy setProperty: #initialExtent toValue: (ext := 300@100).
	dummy topLeft: 50@50; extent: ext.	"reset when comes in"
	str := (TextMorph new) topLeft: dummy topLeft + (10@10); 
		extent: dummy width - 15 @ 30.
	dummy addMorph: str.
	str contents: 'This is a place holder only.  Please \find the original page and choose \"send this page to server"' withCRs.
	str extent: dummy width - 15 @ 30.
	dummy saveOnURL: urlString.

	"Claim that url myself"
	self setProperty: #SqueakPage toValue: dummy sqkPage.
	(dummy sqkPage) contentsMorph: self; dirty: true.
	^ self url