A Project stores the state of a complete Squeak desktop, including
the windows, and the currently active changeSet.  A project knows who
its parent project is.  When you change projects, whether by entering
or exiting, the screen state of the project being exited is saved in
that project.

A project is retained by its view in the parent world.  It is
effectively named by the name of its changeSet, which can be changed
either by renaming in a changeSorter, or by editing the label of its
view from the parent project.

As the site of major context switch, Projects are the locus of
swapping between the old MVC and the new Morphic worlds.  The
distinction is based on whether the variable 'world' contains a
WorldMorph or a ControlManager.

Saving and Loading
Projects may be stored on the disk in external format.  (Project
named: 'xxx') exportSegment, or choose 'store project on file...'.
Projects may be loaded from a server and stored back.  Storing on a
server never overwrites;  it always makes a new version.  A project
remembers the url of where it lives in urlList.  The list is length
one, for now.  The url may point to a local disk instead of a server.
All projects that the user looks at are cached in the Squeaklet
folder.  Sorted by server.  The cache holds the most recent version
only.

When a project is loaded into Squeak, its objects are converted to
the current version.  There are three levels of conversion.  First,
each object is converted from raw bits to an object in its old
format.  Then it is sent some or all of these messages:
	comeFullyUpOnReload: smartRefStream  		Used to
re-discover an object that already exists in this image, such as a
resource, global variable, Character, or Symbol.  (sent to objects in
outPointers)
	convertToCurrentVersion: varDict refStream: smartRefStrm
		fill in fields that have been added to a class since
the object was stored.  Used to set the extra inst var to a default
value.  Or, return a new object of a different class.  (sent to
objects that changed instance variables)
	fixUponLoad: aProject refStream: smartRefStrm
	change the object due to conventions that have changed on the
project level.  (sent to all objects in the incoming project)

Here is the calling sequence for storing out a Project:
Project saveAs
Project storeOnServer
Project storeOnServerWithProgressInfo
Project storeOnServerInnards
Project exportSegmentFileName:directory:
Project exportSegmentWithChangeSet:fileName:directory:
ImageSegment writeForExportWithSources:inDirectory:changeSet:

