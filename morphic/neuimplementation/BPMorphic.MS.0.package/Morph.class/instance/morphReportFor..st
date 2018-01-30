printing
morphReportFor: attributeList 
	| s |
	s := WriteStream on: String new.
	self
		morphReportFor: attributeList
		on: s
		indent: 0.
	StringHolder new contents: s contents;
		 openLabel: 'morph report'