I am a subclass of ImageReadWriter that decodes portable anymap file formats
(pbm, pgm, ppm and  pam) images.

I accept the #origin pragma for SE files as described in:
Algoritms For Image Processing And Computer Vision. J. R. Parker

Don't work with 2 bytes samples (16 bit grays, > 32 bits color, etc...), 
pam files preliminary support.

f := ImageReadWriter formFromFileNamed: 'Tools:Squeak3.4:Carmen.ppm'.
f morphEdit

Submitted by Javier Diaz Reinoso, Oct/2003