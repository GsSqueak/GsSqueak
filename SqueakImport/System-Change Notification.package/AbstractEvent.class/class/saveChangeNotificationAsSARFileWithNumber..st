temporary
saveChangeNotificationAsSARFileWithNumber: aNumber 
	"Use the SARBuilder package to output the SystemChangeNotification 
	stuff as a SAR file. Put this statement here so that I don't forget it 
	when moving between images :-)"
	"self saveChangeNotificationAsSARFileWithNumber: 6"

	| filename changesText readmeText dumper |
	filename := 'SystemchangeNotification'.
	dumper := self class environment at: #SARChangeSetDumper ifAbsent: [ ^self ].
	changesText := 
'
0.6 Version for Squeak 3.7 (no longer for 3.6!!) Changed one hook method to make this version work in Squeak3.7. Download version 5 from http://www.iam.unibe.ch/~wuyts/SystemchangeNotification5.sar if you are working with Squeak 3.6.

0.5 Updated the safeguard mechanism so that clients with halts and errors do not stop all notifications. Added and updated new tests for this. If this interests you have a look at the class WeakActionSequenceTrappingErrors.

0.4 Ported to Squeak 3.6.

0.3 Added the hooks for instance variables (addition, removal and renaming). Refactored the tests.

0.2 Added hooks and tests for method removal and method recategorization.

0.1 First release'.
	readmeText :=
'Implements (part of) the system change notification mechanism. Clients that want to receive notifications about system changes should look at the category #public of the class SystemChangeNotifier, and the unit tests.

VERY IMPORTANT: This version is for Squeak 3.7 only. It will not work in Squeak version 3.6. Download and install the last version that worked in Squeak 3.6 (version 5) from the following URL: http://www.iam.unibe.ch/~wuyts/SystemchangeNotification5.sar'.

	(dumper
		on: Project current changeSet
		including: (ChangeSet allChangeSetNames
				select: [:ea | 'SystemChangeHooks' match: ea])) changesText: changesText;
		 readmeText: readmeText;
		 fileOutAsZipNamed: filename , aNumber printString , '.sar'