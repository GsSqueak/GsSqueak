A global cache of web pages known to this Squeak image.  Since there is a single, global page cache, it is implemented entirely as class methods.

Once a page has an entry, keep it.  (url string -> A SqueakPage)  The SqueakPage has a thumbnail and other info, but may not have the contentsMorph.  The morph is purged when space is needed, and fetched from the server as needed.

See SqueakPage's comment for the stages of in/out.