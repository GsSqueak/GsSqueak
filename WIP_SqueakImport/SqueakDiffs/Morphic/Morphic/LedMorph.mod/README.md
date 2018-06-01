I am a collection of LED digits that can display a decimal value.  The display can be set to flash by sending flash: true.

LedMorph can now display characters:

LedMorph new  string:'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'; openInWorld

Lowercase letters will be converted to Uppercase. Carachters not in the examle
above will be shown as SPACE which is char 36 in LedCharacterMorph.

LedMorph new  chars: 10; string:'           I must get a life';flash:true;scrollLoop:true; openInWorld

The number of letters is set by chars. 
If chars is not specified it will be set to the string size. 
When the string size is bigger than chars
the string will scroll across the led. WOW!
scrollLoop let's you set the scrolling to start over once its finished.

Enjoy.

