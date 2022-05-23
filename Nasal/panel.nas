print("loaded panel.nas");

var title = "Instruments";

    #rgb values for panel, last value is maximum alpha for panel
    var rgb = [0.45, 0.63, 0.79, 0.80];

    ## create a new window, dimensions are WIDTH x HEIGHT, using the dialog decoration (i.e. titlebar)
    var window = canvas.Window.new([258,1200], nil)
       .set('title',title);

    #hide the panel window and set the showing flag to indicate it is not showing
    window.hide();
    setprop("/sim/gui/canvas/window[1]/showing", 0);

    # adding a canvas to the new window and setting up background colors/transparency
    var myCanvas = window.createCanvas().setColorBackground(rgb[0],rgb[1],rgb[2], 0);

    # creating the top-level/root group which will contain all other elements/group

    var root = myCanvas.createGroup();

    ####DISPLAYS####

    #Gyro Compass
    var filename = "Aircraft/USS_Olympia/Instruments/gyro.xml";
    var temp = io.read_properties(filename);
    var layers = temp.getValues().layers.layer;

    #create an image child for the texture
    var child=root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/compass.png" )
        .setScale(1);
    child.setCenter(128,128);
    var compass = child;

    #show speed
    var groundspeed = root.createChild("text")
      .setText("")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(30, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 100);     # where to place the text



     #show direction
     var thrust_vector = root.createChild("text")
      .setText("Forward")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 300);     # where to place the text



    #throttle indicator
    var throttle_label = root.createChild("text")
      .setText("Throttle\nN     |     |     |     |     |     F")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 330);     # where to place the text

     var throttle_indicator = root.createChild("text")
      .setText("|")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(40, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # green, 50% opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(0, 350);       # where to place the text

     #engine rpm
     var engine_rpm = root.createChild("text")
      .setText("0")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(15, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 380);     # where to place the text



     #show rudder
     var rudder_label = root.createChild("text")
      .setText("Rudder\nP     |     |     |     |     |     S")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 420);     # where to place the text

     var rudder_indicator = root.createChild("text")
      .setText("|")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(40, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # green, 50% opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 440);     # where to place the text



     #show heel angle
     var heel_label = root.createChild("text")
      .setText("Heel Degree\nP     |     |     |     |     |     S")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 500);     # where to place the text

     var heel_indicator = root.createChild("text")
      .setText("|")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(60, 1.5)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # green 50% opaque
      .setAlignment("center-bottom") # how the text is aligned to where you place it
      .setTranslation(128, 560);     # where to place the text

     var heel_value = root.createChild("text")
      .setText("")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(15, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 570);     # where to place the text


     #show pitch angle
     var pitch_label = root.createChild("text")
      .setText("Pitch Degree")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 615);     # where to place the text

     var pitch_indicator = root.createChild("text")
      .setText("stn -------- | -------- bow")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # blue 50% opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 645);     # where to place the text

     var pitch_value = root.createChild("text")
      .setText("")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(15, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,0.5)           # blue, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 665);     # where to place the text



    #adding a timer for updating the displays
    print("Making and starting the panel timer");
    var timer = maketimer(0.1, func update() );
    timer.start();

    #adding a timer for fading in and out
    print("Making and starting the fade timer");
    var fade_in_timer = maketimer(0.01, func panel_fade(0.03) );
    var fade_out_timer = maketimer(0.01, func panel_fade(-0.03) );



    ###KICK OFF THE UPDATES###
    window.update();

    var panel_fade = func(interval){
      var i = getprop("/sim/gui/canvas/window[1]/showing");
      i += interval;
      myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], i);
      setprop("/sim/gui/canvas/window[1]/showing", i);
    if(i > rgb[3] and interval > 0){
      fade_in_timer.stop();
      setprop("/sim/gui/canvas/window[1]/showing", 0.8);
      myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], rgb[3]);
    }
    if(i <= 0 and interval < 0){
      fade_out_timer.stop();
      window.hide();
      setprop("/sim/gui/canvas/window[1]/showing", 0);
      myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], 0);
    }
}

var hide = func(){
    fade_out_timer.start();
#    myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], 0);
}

var show = func(){
    myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], 0);
    window.show();
    fade_in_timer.start();
}


# the del() function is the destructor of the Window which will be called upon termination (dialog closing)
# use this to do resource management
window.del = func()
{
  print("Cleaning up window:",title,"\n");
# explanation for the call() technique at: http://wiki.flightgear.org/Object_oriented_programming_in_Nasal#Making_safer_base-class_calls

  print("Stopping the timer");
  timer.stop();

  call(canvas.window.del, [], me);
};



####UPDATE DISPLAYS####
var update = func(){

    #update compass
    var hdg=getprop("/orientation/heading-deg");
    compass.setRotation(-hdg*D2R);

    #update groundspeed
    groundspeed.setText(sprintf("|\n\n%.2f\nkts", getprop("/velocities/groundspeed-kt")));

    #update thrust_vector
    var direction = "Ahead";
    if(getprop("fdm/jsbsim/external_reactions/propeller/x") < 0){
        direction = "Astern";
    }
    thrust_vector.setText("Engine: " ~ direction);
    if(direction == "Astern"){
        thrust_vector.setColor(1,0,0,1);  #make red!
    }
    else {
        thrust_vector.setColor(0,0,0,1);
    }

    #update throttle indicator
    var throttle_setting = 256 * getprop("fdm/jsbsim/fcs/throttle-cmd-norm");
    throttle_indicator.setText("|");
    throttle_indicator.setTranslation(throttle_setting,350);

    #update engine_rpm
    engine_rpm.setText(sprintf("Engine RPM: %.2f", getprop("/fdm/jsbsim/propulsion/engine/engine-rpm")));

    #update rudder indicator
    var rudder_setting = 128 + 128 * getprop("/fdm/jsbsim/fcs/aileron-cmd-norm");
    rudder_indicator.setText("|");
    rudder_indicator.setTranslation(rudder_setting,440);

    #update heel indicator
    var heel_setting = getprop("/fdm/jsbsim/hydro/hull/roll-deg");
    heel_value.setText(sprintf("%.3f", heel_setting));
    heel_indicator.setRotation(heel_setting*D2R);

    #update pitch indicator
    var pitch_setting = getprop("/fdm/jsbsim/hydro/hull/pitch-deg");
    pitch_value.setText(sprintf("%.3f", pitch_setting));
    pitch_indicator.setRotation(-pitch_setting*D2R);

} #end of update function
