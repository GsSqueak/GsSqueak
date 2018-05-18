geometry
userInitials: aString andPicture: aForm

	| cb pictRect initRect f |

	userInitials := aString.
	pictRect := initRect := cb := self cursorBounds.
	userInitials isEmpty ifFalse: [
		f := TextStyle defaultFont.
		initRect := cb topRight + (0@4) extent: (f widthOfString: userInitials)@(f height).
	].
	self userPicture: aForm.
	aForm ifNotNil: [
		pictRect := (self cursorBounds topRight + (0@24)) extent: aForm extent.
	].
	self bounds: ((cb merge: initRect) merge: pictRect).


