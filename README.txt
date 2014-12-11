README.txt

——————————————————————————————————————————————————————————————————
Allison Montroy
Fall 2014
Clarkson University
Digital Arts and Sciences

——————————————————————————————————————————————————————————————————

This set of files was created during one semester at Clarkson University as part of an Independent Study in the Digital Arts and Sciences program. The study was done using Processing in the Java workspace using the Kinect sensor. All of the experiments were done using Mac OS X. 

Please note that if you are planning to connect your Kinect camera with a Mac computer, the setup can be confusing/hard. 

To use these files, you will need to download Processing, found here:
 << https://processing.org/download/ >>

You will also need a Kinect camera. These come in sets with Xbox 360, as well as on their own. Make sure you have a power cord that plugs into the wall to get the camera to work with your computer.

Also note: all of these experiments were done using the first generation of the Kinect camera, for the Xbox 360, THERE IS NO GUARANTEE ANY OF THESE WILL WORK WITH THE CAMERA DESIGNATED FOR THE XBOX ONE.

If you are looking to download the software to make your Kinect work with a Mac, find information at the following links:
<< https://decyborg.wordpress.com/2013/01/19/kinect-on-os-x-10-8-and-processing/ >>
<< http://shiffman.net/p5/kinect/ >>
<< https://code.google.com/p/simple-openni/ >>

Also for beginners: the green light on the Kinect will blink no matter what if it is plugged into your computer and not plugged into an outlet. If it doesn’t seem like your installation is working right, try restarting your computer.

You will need to do some fiddling around in the terminal to get it to work correctly.

For these specific examples, libraries that had to do with connecting the Kinect camera to get data were SimpleOpenNI, and OpenKinect.

——————————————————————————————————————————————————————————————————
Other libraries included:
Box2D for Processing
Geomerative
Fisica
Blob Detection

——————————————————————————————————————————————————————————————————
ISSUES THAT AROSE DURING THE PROCESS:
Many of the difficulties that came from researching the Kinect and Processing from scratch was that a lot of the resources online are out of date in relation to the libraries. A lot of the stuff online was written/developed c. 2012. This can be stressful because the libraries have been updated, and sometimes no longer support functions or other parts originally included in the library. Be careful when looking at sources online.

Also, taking the raw data that you get from the Kinect and trying to understand it and manipulate it in an interesting way in itself can be a bit of a struggle. Looking through the files you will see many sketches with commented out diagrams, keys, and different versions of classes made specifically for collecting and organizing the skeleton data. 

For more in-depth information of what the issues were with certain programs in particular, please read OVERVIEW.txt.

——————————————————————————————————————————————————————————————————

NEXT STEPS:
In continuation of my experiments with the Kinect and Processing, I hope to further my final project and work to create a more intuitive, interesting, and interactive environment for users. This can be done in plenty of ways. I would like to look into whether there is an FPoly or other class within the Fisica library that uses curves to connect the data, rather than lines. I may look into the use of splines in Processing to see if this would be something I could build myself. I also want to work on accessing the PVectors of data and using a sort function on an array of them. This way, the data of each user could be drawn in order of where they are standing, rather than what number user they are. Whether this be with this specific sketch in particular or morphing it into a new, greater idea, is beyond me. But I am looking forward to it.

