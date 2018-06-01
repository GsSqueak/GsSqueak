SqueakMap
newCardForSqueakMap: aSqueakMap
	"Answer a new card."

	^(aSqueakMap newCardWithId: self squeakMapPackageID)
	created: 3236292323
	updated:3236292323
	name: 'SARInstaller for 3.6'
	currentVersion:'16'
	summary: 'Lets you load SAR (Squeak ARchive) files from SqueakMap and the File List. For 3.6 and later images.'
	description:'Support for installing SAR (Squeak ARchive) packages from SqueakMap and the File List.
For 3.6 and later images.

SMSARInstaller will use this if it''s present to load SAR packages.

Use SARBuilder for making these packages easily.'
	url: 'http://bike-nomad.com/squeak/'
	downloadUrl:'http://bike-nomad.com/squeak/SARInstallerFor36-nk.16.cs.gz'
	author: 'Ned Konz <ned@bike-nomad.com>'
	maintainer:'Ned Konz <ned@bike-nomad.com>'
	registrator:'Ned Konz <ned@bike-nomad.com>'
	password:240495131608326995113451940367316491071470713347
	categories: #('6ba57b6e-946a-4009-beaa-0ac93c08c5d1' '94277ca9-4d8f-4f0e-a0cb-57f4b48f1c8a' 'a71a6233-c7a5-4146-b5e3-30f28e4d3f6b' '8209da9b-8d6e-40dd-b23a-eb7e05d4677b' );
	modulePath: ''
	moduleVersion:''
	moduleTag:''
	versionComment:'v16: same as v16 of SARInstaller for 3.4 but doesn''t include any classes other than SARInstaller.

To be loaded into 3.6 images only. Will de-register the 3.4 version if it''s registered.

Added a default (DWIM) mode in which SAR files that are missing both a preamble and postscript have all their members loaded in a default manner.

Changed the behavior of #extractMemberWithoutPath: to use the same directory as the SAR itself.

Added #extractMemberWithoutPath:inDirectory:

Moved several change set methods to the class side.

Made change set methods work with 3.5 or 3.6a/b

Now supports the following file types:

Projects (with or without construction of a ViewMorph)
Genie gesture dictionaries
Change sets
DVS packages
Monticello packages
Graphics files (loaded as SketchMorphs)
Text files (loaded as text editor windows)
Morph(s) in files

Now keeps track of installed members.'