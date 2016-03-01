# Creating Custom Focus Effects in tvOS



In my current side-project, I’m making a tvOS app. One of the screens features a handful of circular buttons. Unfortunately, when the tvOS Focus Engine renders these buttons, they get _really awful_ shadows and focus states, that look a bit [like this](http://clrk.it/1fn4Q).

I had the good fortune of attending Apple’s tvOS Tech Talk in Seattle this winter - which meant I got to ask a few folks in the Q&A lab! They told me that, unfortunately, tvOS doesn’t allow non-roundrect focus effects: the system-standard focused state are pretty “simple” and aren’t clever enough (yet) to alter their shape depending on the alpha-channel of the image in the `UIButton`.

We needed to roll our own custom focus effect - but fortunately, it turned out to be pretty straightforward!

Here’s what the finished product looks like:
![image of finished product](http://clrk.it/13MmT+)

There's a whole write-up about this project over on [devsign.co](devsign.co/notes/custom-focus-effects-in-tvos)

Enjoy!
