###############################################################################
##
## Swedish Navy 20m-class motor torpedo boat for FlightGear.
##  Copyright (C) 2012 - 2018  Anders Gidenstam  (anders(at)gidenstam.org)
##  This file is licensed under the GPL license v2 or later.
##
## Modified for USS Olympia by Jeffery S. Koppe
##  Copyright (C) 2022 Jeffery S. Koppe (jeff.koppe(at)gmail.com)
##
###############################################################################


###############################################################################
var ground = func {
    # Send the current ground level to the JSBSim hydrodynamics model.
    var pos = geo.aircraft_position();
    var material = geodinfo(pos.lat(), pos.lon());
    if (!(material[1] == nil) and contains(material[1], "solid") and
        !material[1].solid) {
        setprop("/fdm/jsbsim/hydro/environment/water-level-ft",
                getprop("/position/ground-elev-ft") +
                getprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft"));
    }

    # Connect the FlightGear wave model to the JSBSim hydrodynamics wave model.
    setprop("/fdm/jsbsim/hydro/environment/waves-from-deg",
            getprop("/environment/wave/angle") - 90.0);
    setprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft",
            getprop("/environment/wave/amp"));
    # Additional properties:
    #   /environment/wave/dangle
    #   /environment/wave/factor
    #   /environment/wave/freq
    #   /environment/wave/sharp

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

var _USS_Olympia_initialized = 0;
setlistener("/sim/signals/fdm-initialized", func {
    if (_USS_Olympia_initialized) return;
    #aircraft.livery.init("Aircraft/MTB_20m/Models/Liveries");
    settimer(ground, 0.0);
    print("Hydrodynamics initialized.");
    _USS_Olympia_initialized = 1;
});
