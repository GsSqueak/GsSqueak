instance creation
newForURL: aURLString

	| pg |
	pg := SqueakPageCache atURL: aURLString.
	^ self new setURL: aURLString page: pg
