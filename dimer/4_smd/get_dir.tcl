#two fixed atoms
$f1 get {x y z}
$f2 get {x y z}
#c_f:(f1+f2)/2

#two smd atoms
$smd1 get {x y z}
$smd2 get {x y z}
#c_smd:(smd1+smd2)/2

set fixedpos [lindex {c_f}]set smdpos [lindex {c_smd}]vecnorm [vecsub $smdpos $fixedpos]