I am a stand-in for an object that is out on the disk.  The object that is out on the disk is the head of a tree of objects that are out.  See SqueakPage.

When any message is sent to me, I don't understand it, and bring in my true object.  I become myself with the objects and resend the message.  

I may not represent the object nil.  
The file is represented as a url, and that url may point at any file on the net.  

page is a SqueakPage.
If the cache already has an object, widely in use, that claims to be the object for my url, what do I do?  I can't become him, since others believe that he is the true object.  Run through memory and replace refs to me with refs to him.  Be careful not to trigger a fault.  Become me to a string, then find pointers and replace?

[[[They don't want to end up holding an ObjectOut.  (would oscillate back and forth)  This is a problem.  A user could bring in two trees that both refer to a 3rd url.  (check with cache before installing any new ObjectOut) Two trees could be written to the same url.
Or, I remain an ObjectOut, and keep getting notUnderstood, and keep returning the other guy.
Or I smash the cache, and install MY page and object.  Other guy is a copy -- still in, but with no place in the cache.  When we both write to the same url, there will be trouble.]  No -- search and replace.]]]
