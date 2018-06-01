I am model that can be used to navigate the host file system. By omitting the volume list, file list, and template panes from the view, I can also be used as the model for an editor on an individual file.

The FileList now provides a registration mechanism to which any tools the filelist uses ***MUST*** register.  This way it is possible to dynamically load or unload a new tool and have the FileList automatically updated.  This change supports a decomposition of Squeak and removes a problem with dead reference to classes after a major shrink.

Tools should implement the following methods (look for implementors in the image):

#fileReaderServicesForFile:suffix: (appropriate services for given file, takes a file name and a lowercased suffix)

#services (all provided services, to be displayed in full list)

These methods both return a collection of SimpleServiceEntry instances.  These contain a class, a menu label and a method selector having one argument.  They may also provide separate button labels and description.

The argument to the specified method will be a string representing the full name of a file when one is selected or the file list itself when there is no selected file.

Tools must register with the FileList calling the class method #registerFileReader: when they load. They also must call #unregisterFileReader: when they unload.

There is a testSuite called FileListTest that presents some examples. 

Stef (I do not like really this distinction passing always a file list could be better)


Old Comments: 


FileLists can now see FTP servers anywhere on the net.  In the volume list menu: 
fill in server info...		Gives you a form to register a new ftp server you want to use.
open server...		Choose a server to connect to.
local disk			Go back to looking at your local volume.


Still undone (you can contribute code):
[ ] Using a Proxy server to get out through a firewall.  What is the convention for proxy servers with FTP?
[ ] Fill in the date and size info in the list of remote files.  Allow sorting by it.  New smarts needed in (ServerDirectory fileNameFormattedFrom:sizePad:sortMode:).
[ ] Currently the FileList has no way to delete a directory.  Since you can't select a directory without going into it, it would have to be deleting the current directory.  Which would usually be empty.