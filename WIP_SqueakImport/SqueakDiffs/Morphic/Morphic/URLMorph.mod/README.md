This morph represents a URL for a SqueakPage. It displays the thumbnail for the associated page, if available. Used in page sorters and for bookmarks.

This morph has several options:
  a. It can act like a thumbnail for sorting (in which case it can be picked up and dragged) or it acts as a bookmark (in which case shift clicking on it activates it).
  b. If it has book set to true, it is a page in a book.  Clicking fetches the index of the book, opens it to the first page, and puts it in the hand.

A thumbnail on a known book:
	(URLMorph grabURL: 'ftp://doltest1.disney.com/squeak/test/p1.sp')
		book: true.

A thumbnail on a single PasteUpMorph:
Make a PasteUpMorph with any morphs in it.
Decide where it should live, make a url string, and copy it.
	'file://HardDisk/books/book1/myPage.sp'
	'ftp://doltest1.disney.com/squeak/test/p1.sp'
Choose 'Save as Web Morph'
Paste in the url.
Drop the resulting thumbnail into some morph.

See SqueakPage's comment for the stages of in/out.

url 
page 		A SqueakPage
isBookmark 		Boolean
book 	A Boolean -- whether I represent a whole book or a page.
