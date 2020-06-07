AmbientLightServer
==================
**** update - 
**** OpenCV moved to github - fixed
**** Newer GCC++ compiler known issue related to a change in the format of g++ -dumpversion - fixed

This is a clone of the AmbientLightServer by @waldobronchart that drives the Ambient Light rig I built. It captures colors from the TV using a webcam, then samples colors at the edge of the screen and updates a bunch of LEDs at the back with those colors.

The sampling region and other camera properties can be controlled by a separate client that connects up to this server. The client is a python qt application that lives in another repo: [https://github.com/waldobronchart/AmbientLightPyClient](https://github.com/waldobronchart/AmbientLightPyClient) 

A video of the project and details on how I built it can be found on Waldo's blog blog: 

* [https://waldobronchart.com/note/ambient-light-tv-with-a-raspberry-pi-part1](https://waldobronchart.com/note/ambient-light-tv-with-a-raspberry-pi-part1)
* [https://waldobronchart.com/note/ambient-light-tv-with-a-raspberry-pi-and-camera-part2](https://waldobronchart.com/note/ambient-light-tv-with-a-raspberry-pi-and-camera-part2)

Building the application
----------------------------------------

If you're interested in getting this to work and changing it fit your own needs, here's a long list of things you need to do to get it to build.

### Preparing the SD card

You'll need at least 4GB space on the card.

Installing
download the install.sh file from the repo, and run it with:
sh install.sh

This will remove the wolfram engine and libreoffice in order to make some room (8gb card minimum required) and install all the pre-requisites, and compile all the required software.

once finished, look at HardwareConfig.h to see how to set up your LEDs (you will need 2 strips).

At this point you may want to create a service that automatically runs it when the Pi boots.
