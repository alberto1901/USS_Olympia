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

        #flood the pointmass with excess weight to prevent the vessel from moving
        setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]",  500000);

        #increase the friction on the contact points
        for (var i=0; i < 3; i = i+1) {
            setprop("/fdm/jsbsim/contact/unit["~i~"]/dynamic_friction_coeff", 500000000);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/static_friction_coeff",  500000000);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/rolling_friction-factor",500000000);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/static_friction-factor", 500000000);
            timer_run_aground.restart(10.0);
        }

        #stop checking to see if the vessel is aground. It is!
        timer_run_aground.stop();

        #once grounded, start checking to see if the player hits the 'refoat' key (r)
        if(!getprop("/sim/model/aground_pitch")) { 
            timer_settle.start();
        }
    }
}; #end of function

#default to checking for grounding every 1/2 second
timer_run_aground = maketimer(0.50, run_aground);

#start checking for grounding when initializing the fdm
setlistener("sim/signals/fdm-initialized", func {
        timer_run_aground.start();
});

###########################################################################

#adjust pitch and heel to indicate grounded status
var settle = func() {
        turrets.rotate_turret("/sim/model/aground_pitch", 0.05, -5, 5);
        turrets.rotate_turret("/sim/model/aground_heel", 0.05, -12, 12);

        #stop settling after heeling has reached 12 degrees. Cut the throttle.
        if(getprop("/sim/model/aground_heel") == 12){
            timer_settle.stop();
            controls.incThrottle(-1.00, 0.0);
        }
}

#set the interval for settling to 0.02 of a second
timer_settle = maketimer(0.02, settle);

###########################################################################

#refloat the vessel
var refloat = func() {
    gui.popupTip("Refloating");

    #repositions the model to floating status
    turrets.rotate_turret("/sim/model/aground_pitch", -0.05,0,5);
    turrets.rotate_turret("/sim/model/aground_heel", -0.05,0,12);
        
    #reset the friction, reset the flooded weight, restart the agound checking with a 10 second delay
    if(getprop("/sim/model/aground_heel") == 0){

        timer_refloat.stop();

        setprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[5]", 0);

        for (var i=0; i < 3; i = i+1) {
            setprop("/fdm/jsbsim/contact/unit["~i~"]/dynamic_friction_coeff", 1);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/static_friction_coeff", 1);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/rolling_friction-factor", 0);
            setprop("/fdm/jsbsim/contact/unit["~i~"]/static_friction-factor", 0);
            timer_run_aground.restart(10.0);
        }
    }
}

timer_refloat = maketimer(0.02, refloat);



