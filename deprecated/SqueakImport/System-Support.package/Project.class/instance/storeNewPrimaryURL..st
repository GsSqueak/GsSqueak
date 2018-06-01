accessing
storeNewPrimaryURL: aURLString
	| oldResourceUrl |
	oldResourceUrl := self resourceUrl.
	urlList isEmptyOrNil ifTrue: [urlList := Array new: 1].
	urlList at: 1 put: aURLString.
	self lastDirectory: nil.
	self resourceManager adjustToNewServer: self resourceUrl from: oldResourceUrl
