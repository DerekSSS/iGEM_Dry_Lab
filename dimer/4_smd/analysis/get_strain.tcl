### Open the log file for reading and the output .dat file for writing
set file [open dimer_smd.log r]
set output [open strain.dat w]

### Set the center of mass of fixed atoms
set x0 -48.075
set y0 77.083
set z0 314.579

### Loop over all lines of the log file
while { [gets $file line] != -1 } {

### Determine if a line contains SMD output. If so, write the
### timestep followed by (delta l)/(l0) to the output file
  if {[lindex $line 0] == "SMD"} {
      if {[lindex $line 1] == "0"} {
           ### Calculate the original length l0 of dimer 
           set l0 [expr (([lindex $line 2]-$x0)**2+([lindex $line 3]-$y0)**2+([lindex $line 4]-$z0)**2)**(0.5)]
           puts $output "0 0.000"
      } else {
           puts $output "[lindex $line 1] [expr ((([lindex $line 2]-$x0)**2+([lindex $line 3]-$y0)**2+([lindex $line 4]-$z0)**2)**(0.5))/$l0-1]"
       }
    }
  }

### Close the log file and the output .dat file
close $file
close $output