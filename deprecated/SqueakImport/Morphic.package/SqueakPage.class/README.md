A SqueakPage is holder for a page of morphs that live on the disk or on a server.
A URLMorph is a thumbnail sized stand-in for the page.  Clicking on it gets the page.
An ObjectOut is a fake object that stands for an object that is out on the disk.  (Like ObjectTracer or ObjectViewer.)
A MorphObjectOut is a subclass that stands for a Morph that is out on the disk.

To find out how to make the pages of any BookMorph go out to the disk (or a server), see 	http://minnow.cc.gatech.edu/SqueakDoc.1 then go to 'SqueakPages'.

A SqueakPage is always in-memory.  Its contentsMorph will be 'become-ed' to a MorphObjectOut tombstone when it goes out.  (A page may or may not be in the cache.  First put it in, then ask it for the data.)  Sending any message to the contentsMorph triggers the fetch.  Many URLMorphs may hold onto one page.  A page has a thumbnail.  A URLMorph points at its page object.

States of a SqueakPage, and the transitions to another state:
1) have a url as a string.  Then: (URLMorph grabURL: 'file://Ted''s/books/tryThis/p1').  
	Drop it into any morph.
2) have a URLMorph, with page==nil.     Click it.  (makes an empty page, installs 
	it in the global page cache)
3) have a URLMorph with a SqueakPage, with contentsMorph==nil, 
	but page is not in the cache (this is a rare case).  ask page contentsMorph.
4) OUT: have a URLMorph with a SqueakPage, with contentsMorph being a MorphObjectOut, 
	and its page is in the cache.  Sending the contentsMorph any message brings it in and
	becomes it to the morph.  (fix up morph's pointer to the page.)
5) Totally IN:  a morph, owned by a SqueakPage, has a page in the cache.  
	The morph is clean.   
	Whenever someone triggers a purge (when?), contentsMorph is becomed
	to a MorphObjectOut. (go to 4)
	Causing the morph to execute layoutChanged marks the morph as dirty.
	(morph's property #pageDirty is set to true) (go to 6)
6) Totally IN and dirty.  
	Whenever any other page is fetched from the disk or the net, all other 
	dirty pages are written and marked clean.  (go to 5)

Note that the entire tree of submorphs goes out -- hundreds of objects.  Bringing the object back in brings in the SqueakPage, installs it in the cache.  Classes other than PasteUpMorph can easily be made to send their contents out if there is any need.

Note that every book is now automatically a WebBook.  We simply give a page a url and tell it to purge.

url		a string
title		
comment		
thumbnail		
contentsMorph		(1) a pasteUpMorph with other morphs in it.
					(2) a MorphObjectOut.  Sending any message brings it in. 
					(3) nil if the page has never been in this image.
creationTime		
creationAuthor		
lastChangeTime		
lastChangeAuthor 
policy		#alwaysWrite, #neverWrite, #ask.  (cache can override with a global policy)
			(Explicit writing by user has policy #neverWrite)
dirty 		(Morph>>layoutChanged sends changed: #SqueakPage. If policy==#check, 
				then the page sets dirty_true.)
			(If policy==#alwaysWrite, then set dirty when the page is retrieved from the cache.)

Class MorphObjectOut has an instance variable called page.
All messages to an MorphObjectOut cause it to be brought in.  Except the messages needed to write the MorphObjectOut on the disk as part of a parent's being sent out.  (size, class, instSize, instVar:at:.  Can rename these and call from its own version of the writing routine.)
	To purge, go through the clean pages, and any that have world not equal to this world, entomb them.  
	(If an object in the subtree is held by an object outside the tree, it will remain,  And will be duplicated when the tree comes back in.  This is a problem already in normal uses of SmartRefStream.)


