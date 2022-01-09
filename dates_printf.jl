#=  Name:       dates_printf.jl
    Programmer: Steve Rock
 	Date:		01/09/2021
 	Comments:	This included file contains constants,
				using references, and functions useful
				for dates and printf enhancements.
=#

const LINEFEEDS = ['\n', '\r', '\u85', '\u0B', '\u0c', '\u2028', '\u2029']
const TESTPATH = "C:\\Data\\JuliaTest\\"

using Dates
using Printf

function get_output_fname(parm_datetime::DateTime)
	s_datetime = @sprintf "%s" parm_datetime
	s_dt = first(s_datetime, 10)
	s_tm = SubString(s_datetime, 11, 3)
	s_tm *= SubString(s_datetime, 15, 2) * SubString(s_datetime, 18, 2)
    s_fname = TESTPATH * "CommencementExtract_" * s_dt * s_tm * "_dups.txt"
	return s_fname
end
