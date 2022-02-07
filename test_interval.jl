#=  Name:       test_interval.jl
    Programmer: Steve Rock
 	Date:		02/06/2022
 	Comments:	This program tests the struct Interval.
=#
include("interval.jl")
include("dates_printf.jl")

# Called functions
function get_output_fname()
	return "C:\\Users\\sjrci\\Documents\\GitHub\\Experiment\\intrvl_tuple.txt"
end

function write_interval_tuple(parm_intrvltuple)
	fnameout = get_output_fname()
	fout = open(fnameout, "w")
	nlinesout = 0
	for x1 in generate(parm_intrvltuple[1])
		for x2 in generate(parm_intrvltuple[2])
			for x3 in generate(parm_intrvltuple[3])
				for x4 in generate(parm_intrvltuple[4])
					for x5 in generate(parm_intrvltuple[5])
						for x6 in generate(parm_intrvltuple[6])
							for x7 in generate(parm_intrvltuple[7])
								for x8 in generate(parm_intrvltuple[8])
									sline = "($(x1),"
									sline *= " $(x2),"
									sline *= " $(x3),"
									sline *= " $(x4),"
									sline *= " $(x5),"
									sline *= " $(x6),"
									sline *= " $(x7),"
									sline *= " $(x8))"
									println(fout, sline)
									nlinesout += 1
								end
							end
						end
					end
				end
			end
		end
	end
	close(fout)
	return nlinesout
end

# Main routine function

function main()
	println("Program test_interval begins. . .")
	s_now = now()
	println("Start time: ", s_now)
	s_abortmsg = "Program test_interval ended unsuccessfully."

	nlinesread, nlineswritten = 0, 0
	Δ = 0.25 # 1//4
	interval_tuple = (Interval(0.0, 1.0, Δ),
	                  Interval(1.0, 2.0, Δ),
					  Interval(2.0, 3.0, Δ),
					  Interval(3.0, 4.0, Δ),
					  Interval(4.0, 5.0, Δ),
					  Interval(5.0, 6.0, Δ),
					  Interval(6.0, 7.0, Δ),
					  Interval(7.0, 8.0, Δ))
	nlineswritten = write_interval_tuple(interval_tuple)
	println()

	# Write a diagnostic summary

	@printf("Number input lines read:      %8d\n", nlinesread)
	@printf("Number output lines written:  %8d\n", nlineswritten)
	println("Program test_interval has ended successfully.")
	println("End time:   ", now())
end # main

main()
