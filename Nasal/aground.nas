#functions for handling running aground by checking the 'solid' property of contacts

print("Loaded aground.nas");


var run_aground = func{
#    gui.popupTip('collision detection enabled');

    #Once started, restart the timer to check for grounding every 1/2 second.
    #This is necessary because after refloating this check is started with a
    #10 second interval to give the player time to back away from the ground.
    #Once they do that, however, we want to revert to checking twice a second.

    timer_run_aground.restart(0.5);

    var warning = "";

    #check to see if any of the contact points have connected with solid land
    if (getprop("/fdm/jsbsim/contact/unit[0]/solid") == 1){
        warning = warning ~ "bow ";
    };
     if (getprop("/fdm/jsbsim/contact/unit[1]/solid") == 1){
        warning = warning ~ "stern ";
    };
     if (getprop("/fdm/jsbsim/contact/unit[2]/solid") == 1){
        warning = warning ~ "port side ";
    };
     if (getprop("/fdm/jsbsim/contact/unit[3]/solid") == 1){
        warning = warning ~ "starboard side";
    };

    #Yes, we have a grounded vessel!
    if(warning != ""){
        gui.popupTip("Oh No! I'm aground on the "~warning~"!");
        setprop("/position/aground", "true");

        setprop("/fdm/jsbsim/forces/hold-down", "true");
        interpolate("/orientation/roll-deg", 10, 3);
        interpolate("/orientation/pitch-deg", 5, 3);

        #kill the throttle
        controls.incThrottle(-1.00, 0.0);

        #stop checking to see if the vessel is aground. It is!
        timer_run_aground.stop();

    } #end if warning
}; #end of function

#default to checking for grounding every 1/2 second
timer_run_aground = maketimer(0.50, run_aground);

#start checking for grounding when initializing the fdm
setlistener("sim/signals/fdm-initialized", func {
        timer_run_aground.start();
});


###########################################################################

#refloat the vessel
var refloat = func() {

    gui.popupTip("Refloating");

    setprop("/fdm/jsbsim/forces/hold-down", "false");
    setprop("/position/aground", "false");

    #start checking for grounding again but give a 10 second delay to allow backing off the ground
    timer_run_aground.restart(10.0);
}

###########################################################################

#anchor the vessel
var weigh_anchor = func() {

      gui.popupTip("Raising Anchor");
      interpolate("/fdm/jsbsim/hydro/drag-tweak-factor", 1, 10);
      interpolate("/fdm/jsbsim/hydro/yaw-tweak-factor", 1, 10);
      setprop("/fdm/jsbsim/hydro/pitch-tweak-factor", 1);
      setprop("/fdm/jsbsim/hydro/roll-tweak-factor", 1);
      setprop("/position/anchored", "false");

}

var drop_anchor = func() {

      gui.popupTip("Dropping Anchor");
      interpolate("/fdm/jsbsim/hydro/drag-tweak-factor", 1000, 10);
      interpolate("/fdm/jsbsim/hydro/yaw-tweak-factor", 10000, 10);
      setprop("/fdm/jsbsim/hydro/pitch-tweak-factor", 0.0001);
      setprop("/fdm/jsbsim/hydro/roll-tweak-factor", 0.0001);
      setprop("/position/anchored", "true");
}
