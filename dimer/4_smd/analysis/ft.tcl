### Open the log file for reading and the output .dat file for writing
set file [open dimer_smd.log r]
set output [open ft.dat w]

#(nx ny nz) is the pulling direction
set nx 0.008655146181730121  
set ny -0.7145344095143026
set nz -0.699546757597103


### Loop over all lines of the log file
while { [gets $file line] != -1 } {

### Determine if a line contains SMD output. If so, write the
### timestep followed by f(dot)n to the output file
  if {[lindex $line 0] == "SMD"} {
      puts $output "[lindex $line 1] [expr $nx*[lindex $line 5] + $ny*[lindex $line 6] + $nz*[lindex $line 7]]"
    }
  }

### Close the log file and the output .dat file
close $file
close $output