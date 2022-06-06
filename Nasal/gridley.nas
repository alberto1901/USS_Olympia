print("Loaded gridely.nas");

#initial ranges for rotations
var up = 40;
var right = 60;

#60% chance of movement every 3 seconds; 20% binoculars, another 40% chance for scanning
var scan_horizon = func{

  var i = rand();

  #raise/lower binoculars (0 to 20) or scan horizon (21 to 60)
  if(i < 0.2){
    interpolate("/sim/model/binocular_pitch", up, 1);

    #toggle raise/lower binoculars
    if(up == 40) {
      up = 0;
    }
    else {
      up = 40;
    }
  }
  else if(i < 0.6) {
    interpolate("/sim/model/torso_yaw", right, 5);

    #randomize direction and degree of next scanning movement but limit to maximum/minimum of 80/-80 degrees
    right = (80*rand()) - (80*rand());
  }

} #end of func scan_horizon


#default to checking for scanning every 3 seconds
timer_scan_horizon = maketimer(3.0, scan_horizon);

#start checking for scanning when initializing the fdm
setlistener("sim/signals/fdm-initialized", func {
        timer_scan_horizon.start();
});
