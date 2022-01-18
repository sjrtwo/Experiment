#=  Name:       test_interval.jl
    Programmer: Steve Rock
 	Date:		01/16/2021
 	Comments:	This program tests the struct Interval.
=#
include("interval.jl")
include("dates_printf.jl")

# Called functions

# Main routine function

println("Program test_interval begins. . .")
s_now = now()
println("Start time: ", s_now)
s_abortmsg = "Program test_interval ended unsuccessfully."

nlinesread, nlineswritten, prevline = 0, 0, " "

x = Interval(0, 10, 1)
x2 = Interval(10, 1, 1)

# Write a diagnostic summary

@printf("Number input lines read:      %8d\n", nlinesread)
@printf("Number output lines written:  %8d\n", nlineswritten)
println("Program test_interval has ended successfully.")
println("End time:   ", now())
