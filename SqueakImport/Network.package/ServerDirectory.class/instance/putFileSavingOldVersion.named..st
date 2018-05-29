up/download
putFileSavingOldVersion: fileStream named: fileNameOnServer

	| tempName oldName |
	"Put a copy of this file out after saving the prior version.
	Nothing happens to the old version until the new vers is successfully stored."
 	tempName := fileNameOnServer , '.beingWritten'.
	oldName := fileNameOnServer , '.prior'.
	self putFile: fileStream named: tempName retry: true.
	(self includesKey: oldName) ifTrue: [self deleteFileNamed: oldName].
	self rename: fileNameOnServer toBe: oldName.
	self rename: tempName toBe: fileNameOnServer.
