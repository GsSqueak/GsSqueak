fileIn/Out
fileOut  "SystemOrganization fileOut"

	| internalStream |
	internalStream := WriteStream on: (String new: 30000).
	internalStream nextPutAll: 'SystemOrganization changeFromCategorySpecs: #('; cr;
		print: SystemOrganization;  "ends with a cr"
		nextPutAll: ')!'; cr.

	FileStream writeSourceCodeFrom: internalStream baseName: (FileDirectory default nextNameFor: 'SystemOrganization' extension: 'st') isSt: true useHtml: false
