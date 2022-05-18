#the statistics printed out from AndersG's ships

###############################################################################
var ground = func {
    # Send the current ground level to the JSBSim hydrodynamics model.
    setprop("/fdm/jsbsim/hydro/environment/water-level-ft",
            getprop("/position/ground-elev-ft") +
            getprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft"));

    # Connect the JSBSim hydrodynamics wave model with the custom water shader.
    setprop("environment/waves/time-sec",
            getprop("/fdm/jsbsim/simulation/sim-time-sec"));
    setprop("environment/waves/from-deg",
            getprop("/fdm/jsbsim/hydro/environment/waves-from-deg"));
    setprop("environment/waves/length-ft",
            getprop("/fdm/jsbsim/hydro/environment/wave-length-ft"));
    setprop("environment/waves/amplitude-ft",
            getprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft"));
    setprop("environment/waves/angular-frequency-rad_sec",
            getprop("/fdm/jsbsim/hydro/environment/wave/angular-frequency-rad_sec"));
    setprop("environment/waves/wave-number-rad_ft",
            getprop("/fdm/jsbsim/hydro/environment/wave/wave-number-rad_ft"));


    settimer(ground, 0.0);
}

settimer(ground, 0.0);

# On-screen displays
var left  = screen.display.new(20, 10);
var right = screen.display.new(-300, 10);

left.add("/fdm/jsbsim/sim-time-sec");
left.add("/orientation/heading-magnetic-deg");
left.add("/fdm/jsbsim/hydro/beta-deg");
left.add("/fdm/jsbsim/hydro/pitch-deg");
left.add("/fdm/jsbsim/hydro/roll-deg");
left.add("/fdm/jsbsim/hydro/height-agl-ft");
left.add("/fdm/jsbsim/inertia/cg-x-in");
left.add("/fdm/jsbsim/inertia/cg-z-in");
left.add("/fdm/jsbsim/fcs/rudder-pos-norm");
#left.add("/fdm/jsbsim/hydro/qbar-u-psf");
#left.add("/fdm/jsbsim/hydro/qbar-v-psf");
#left.add("/fdm/jsbsim/hydro/fbx-lbs");
#left.add("/fdm/jsbsim/hydro/fby-lbs");
left.add("/fdm/jsbsim/hydro/fdrag-lbs");
left.add("/fdm/jsbsim/hydro/fbz-lbs");
left.add("/fdm/jsbsim/hydro/X/force-lbs");
left.add("/fdm/jsbsim/hydro/Y/force-lbs");
left.add("/fdm/jsbsim/hydro/yaw-moment-lbsft");
left.add("/fdm/jsbsim/hydro/pitch-moment-lbsft");
left.add("/fdm/jsbsim/hydro/roll-moment-lbsft");
#left.add("/fdm/jsbsim/");
#left.add("/fdm/jsbsim/");

right.add("/fdm/jsbsim/contact/unit/solid");
right.add("/fdm/jsbsim/hydro/v-kt");
right.add("/fdm/jsbsim/hydro/vbx-fps");
right.add("/fdm/jsbsim/hydro/vby-fps");
right.add("/fdm/jsbsim/propulsion/boiler/steam-absolute-pressure-psi");
right.add("/fdm/jsbsim/propulsion/engine/steam-mean-pressure-psi");
right.add("/fdm/jsbsim/propulsion/engine/power-available-hp");
right.add("/fdm/jsbsim/propulsion/engine/power-required-hp");
right.add("/fdm/jsbsim/propulsion/engine/engine-rpm");
right.add("/fdm/jsbsim/propulsion/engine/advance-ratio");
right.add("/fdm/jsbsim/propulsion/engine/thrust-lbs");
right.add("/fdm/jsbsim/propulsion/engine/shaft-position-norm");
#right.add("/fdm/jsbsim/");

###############################################################################

