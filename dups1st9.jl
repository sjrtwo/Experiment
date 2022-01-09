#=  Name:       dups1st9.jl
    Programmer: Steve Rock
 	Date:		12/20/2021
 	Comments:	This program searches an input file for duplicates
	            in the first 9 characters, and writes the duplicate to an output file.
=#
include("dates_printf.jl")

# Called functions

function get_input_fname()
	return TESTPATH * "CommencementExtract.txt"
end

# Main routine function

println("Program dups1st9 begins. . .")
s_now = now()
println("Start time: ", s_now)
s_abortmsg = "Program dups1st9 ended unsuccessfully."

nlinesread, nlineswritten, prevline = 0, 0, " "

fout = open(get_output_fname(s_now), "w")

open(get_input_fname()) do fin
    for sline in eachline(fin)
	    global nlinesread += 1
	    if sline in LINEFEEDS
		    continue
	    end
	    if first(sline, 9) == first(prevline, 9)
		    println(fout, sline)
		    global nlineswritten += 1
	    else
		    global prevline = sline
	    end # if
	end # for
end # open

close(fout)

# Write a diagnostic summary

@printf("Number input lines read:      %8d\n", nlinesread)
@printf("Number output lines written:  %8d\n", nlineswritten)
println("Program dups1st9 has ended successfully.")
println("End time:   ", now())
