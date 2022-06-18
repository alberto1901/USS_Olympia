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

    #create an image for the texture
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


   #create an image for the texture
    var anchor = root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/anchor.png" )
        .setScale(.6)
        .setTranslation(116,270);

   #create an image for the texture
    var ground = root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/ground.png" )
        .setScale(.6)
        .setTranslation(116,270);

    #create an image for the texture
    var psi_gauge_0 = root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/psi_gauge.png" )
        .setScale(.6)
        .setTranslation(135,270);

     var throttle_0_indicator = root.createChild("text")
      .setText("|")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(50)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,0.5)           # black, 50% opaque
      .setAlignment("center-bottom") # how the text is aligned to where you place it
      .setTranslation(192, 330)       # where to place the text
      .setRotation(-90*D2R);

     #engine_0_rpm
     var engine_0_rpm = root.createChild("text")
      .setText("Stbd Engine\nrpm: 0")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(15, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(192, 360);     # where to place the text


    #create an image for the texture
    var psi_gauge_1 = root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/psi_gauge.png" )
        .setScale(.6)
        .setTranslation(4,270);

     var throttle_1_indicator = root.createChild("text")
      .setText("|")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(50)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,0.5)           # black, 50% opaque
      .setAlignment("center-bottom") # how the text is aligned to where you place it
      .setTranslation(64, 330)      # where to place the text
      .setRotation(-90*D2R);

     #engine_1_rpm
     var engine_1_rpm = root.createChild("text")
      .setText("Port Engine\nrpm: 0")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(15, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,0,1)             # black, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(64, 360);      # where to place the text





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


     #create an image for the texture
     var floatgear_logo = root.createChild("image")
        .setFile( "Aircraft/USS_Olympia/Instruments/FloatGear_logo.png" )
        .setScale(.4)
        .setTranslation(90,1100);

      var floatgear_text = root.createChild("text")
      .setText("FloatGear")
      .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
      .setFontSize(24, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(0,0,1,1)           # blue, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(128, 1190);     # where to place the text

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

    #update engine_0_rpm
    engine_0_rpm.setText(sprintf("Stbd Engine\nrpm: %.2f", getprop("fdm/jsbsim/propulsion/engine[0]/engine-rpm")));

    if(getprop("fdm/jsbsim/external_reactions/propeller[0]/x") < 0){
        engine_0_rpm.setColor(1,0,0,1);
    }
    else {
        engine_0_rpm.setColor(0,0,0,1);
    }

    #update stbd throttle indicator
    var pressure_0 = getprop("/fdm/jsbsim/propulsion/engine[0]/steam-mean-pressure-psi");
    throttle_0_indicator.setRotation((pressure_0 - 90) * D2R);

    #if engine[0] is not currently selected, set gauge to 50% transparent
    if(!getprop("/sim/input/selected/engine[0]")){
      psi_gauge_0.set("fill", "rgba(255,255,255,0.5)");
    }
    else {
      psi_gauge_0.set("fill", "rgba(255,255,255,1.0)");
    }


    #update engine_1_rpm
    engine_1_rpm.setText(sprintf("Port Engine\nrpm: %.2f", getprop("fdm/jsbsim/propulsion/engine[1]/engine-rpm")));

    if(getprop("fdm/jsbsim/external_reactions/propeller[1]/x") < 0){
        engine_1_rpm.setColor(1,0,0,1);
    }
    else {
        engine_1_rpm.setColor(0,0,0,1);
    }

    #update throttle 1 indicator
    var pressure_1 = getprop("/fdm/jsbsim/propulsion/engine[1]/steam-mean-pressure-psi");
    throttle_1_indicator.setRotation((pressure_1 - 90)*D2R);

    #if engine[1] is not currently selected, set gauge to 50% transparent
    if(!getprop("/sim/input/selected/engine[1]")){
      psi_gauge_1.set("fill", "rgba(255,255,255,0.5)");
    }
    else {
      psi_gauge_1.set("fill", "rgba(255,255,255,1.0)");
    }

    #update anchor indicator
    if(getprop("/position/anchored")){
        anchor.set("fill", "rgba(255,255,255,1.0)");
    }
    else {
        anchor.set("fill", "rgba(255,255,255,0.0)");
    }

    #update ground indicator
    if(getprop("/position/aground")){
        ground.set("fill", "rgba(255,255,255,1.0)");
    }
    else {
        ground.set("fill", "rgba(255,255,255,0.0)");
    }


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
