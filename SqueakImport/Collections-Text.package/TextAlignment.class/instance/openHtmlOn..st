html
openHtmlOn: aHtmlReadWriter 

	self alignment = Centered ifTrue: [aHtmlReadWriter nextPutAll: '<center>'].
	self alignment = Justified ifTrue: [aHtmlReadWriter nextPutAll: '<div align=justify>'].
	self alignment = LeftFlush ifTrue: [aHtmlReadWriter nextPutAll: '<div align=left>'].
	self alignment = RightFlush ifTrue: [aHtmlReadWriter nextPutAll: '<div align=right>'].
