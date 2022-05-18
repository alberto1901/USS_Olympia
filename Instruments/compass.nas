var CanvasApplication = {

   # constructor
   new: func(x=300,y=200) {
      var m = { parents: [CanvasApplication] };
      m.dlg = canvas.Window.new([x,y],"dialog");
      m.canvas = m.dlg.createCanvas().setColorBackground(1,1,1,1);
      m.root = m.canvas.createGroup();

      m.timer = maketimer(0.1, func m.update() );
      m.init();
      return m;
   },

   del: func() { 
        print("Stopping the timer");
        me.timer.stop();
    },


   update: func() {

     #update compass
     var hdg=getprop("/orientation/heading-deg");
     me.compass.setRotation(-hdg*D2R);

     #update groundspeed
     var speed=getprop("/velocities/groundspeed-kt");
     me.groundspeed.setText(sprintf("G %3d", speed.getValue()));
   },

   init: func() {

     #Gyro Compass
     var filename = "Aircraft/USS_Olympia/Instruments/gyro.xml";
     var temp = io.read_properties(filename);
     var layers = temp.getValues().layers.layer;

 #    var z=100;
       #create an image child for the texture
       var child=me.root.createChild("image")
           .setFile( "Aircraft/USS_Olympia/Instruments/compass.png" )
           .setScale(1);
     
          child.setCenter(128,128);
          me.compass = child;



     var gs = me.root.createChild("text")
      .setText("Hello world!")
      .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
      .setColor(1,0,0,1)             # red, fully opaque
      .setAlignment("center-center") # how the text is aligned to where you place it
      .setTranslation(140, 280);     # where to place the text
    
      me.groundspeed = gs;


     me.timer.start();
     },
}; # end of CanvasApplication


var InstrumentWidget = {
   new: func(x,y) {
      var m = CanvasApplication.new(x:x,y:y);
   },
};

var panel = InstrumentWidget.new(x:900, y:300);
print("Compass Loaded...!");


