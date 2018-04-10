initialization
dynamicButtonServices
	"Answer services for buttons that may come and go in the button
	pane, depending on selection"
	^ fileName isEmptyOrNil
		ifTrue: [#()]
		ifFalse: [| toReject |
			toReject := self buttonSelectorsToSuppress.
			(self itemsForFile: self fullName)
				reject: [:svc | toReject includes: svc selector]]