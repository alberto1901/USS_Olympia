#functions for handling the turrets

print("Loaded turrets.nas");

var rotate_turret = func(prop, direction, min, max) {
  var value = getprop(prop);
  value = value == nil? 0 : value + direction;
  value = value < min ? min : value;
  value = value > max ? max : value;
  setprop(prop, value);
};



