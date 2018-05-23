A collection of pages, each of which is a place to put morphs.  Allows one or another page to show; orchestrates the page transitions; offers control panel for navigating among pages and for adding and deleting pages.

To write a book out to the disk or to a file server, decide what folder it goes in.  Construct a url to a typical page:
	file://myDisk/folder/myBook1.sp
or
	ftp://aServer/folder/myBook1.sp

Choose "send all pages to server" from the book's menu (press the <> part of the controls).  Choose "use page numbers".  Paste in the url.

To load an existing book, find its ".bo" file in the file list browser.  Choose "load as book".

To load an existing book from its url, execute:
¦(URLMorph grabURL: 'ftp://aServer/folder/myBook1.sp') book: true.

Multiple people may modify a book.  If other people may have changed a book you have on your screen, choose "reload all from server".

Add or modify a page, and choose "send this page to server".

The polite thing to do is to reload before changing a book.  Then write one or all pages soon after making your changes.  If you store a stale book, it will wipe out changes that other people made in the mean time.

Pages may be linked to each other.  To create a named link to a new page, type the name of the page in a text area in a page.  Select it and do Cmd-6.  Choose 'link to'.  A new page of that name will be added at the back of the book.  Clicking on the blue text flips to that page.  
	To create a link to an existing page, first name the page.  Go to that page and Cmd-click on it.  The name of the page is below the page.  Click in it and backspace and type.  Return to the page you are linking from.  Type the name. Cmd-6, 'link to'.  

Text search:  Search for a set of fragments.  allStrings collects text of fields.  Turn to page with all fragments on it and highlight the first one.  Save the container and offset in properties: #searchContainer, #searchOffset, #searchKey.  Search again from there.  Clear those at each page turn, or change of search key.  

[rules about book indexes and pages:  Index and pages must live in the same directory. They have the same file prefix, followed by .bo for the index or 4.sp for a page (or x4.sp).  When a book is moved to a new directory, the load routine gets the new urls for all pages and saves those in the index.  Book stores index url in property #url.  
    Allow mulitple indexes (books) on the same shared set of pages.  If book has a url in same directory as pages, allow them to have different prefixes.
	save all pages first time, save one page first time, fromRemoteStream: (first time)
	save all pages normal , save one page normal, reload
	where I check if same dir]
URLMorph holds url of both page and book.