#=  Name:       bkupfiles.jl
	Programmer:  Steve Rock
	Date:        02/04/2022
	Comments:	 This program backs up all of the *.jl files from an input directory
					 into an output directory.  Both the input and output directories
					 must already exist.
=#
if !@isdefined FILETYPES
	const FILETYPES = [".txt", ".jl"]
end

using Dates
using Printf

# Called functions

function get_input_dir()
	return "C:\\Users\\sjrci\\Documents\\GitHub\\Experiment"
end
function get_output_dir()
	return "E:\\Bkup\\Experiment"
end

function get_output_fname(parm_fname_pfx::String,
							parm_fname_sfx::String,
	 						parm_datetime::DateTime)
	s_datetime = @sprintf "%s" parm_datetime
	s_dt = first(s_datetime, 10)
	s_tm = SubString(s_datetime, 12, 13) * SubString(s_datetime, 15, 16)
	s_fname = parm_fname_pfx * "_" * s_dt * "_" * s_tm * parm_fname_sfx
	return s_fname
end

# Main routine function

function main()
	println("Program bkupfiles begins. . .")
	s_now = now()
	println("Start time: ", s_now)
	s_abortmsg = "Program bkupfiles ended unsuccessfully."

	nfilesread, nfileswritten = 0, 0

	dout = get_output_dir()
	for fnamein in readdir(get_input_dir())
		fname, file_ext = splitext(fnamein)
		# @printf("fname = \"%s\"\n", fname)
		# @printf("file_ext = \"%s\"\n", file_ext)
		if file_ext ∉ FILETYPES
			continue
		end # if file_ext
		path_fname = dout * "\\" * fname
		fnameout = get_output_fname(path_fname, file_ext, s_now)
		# @printf("fnameout = \"%s\"\n", fnameout)
		fin = open(fnamein, "r")
		fout = open(fnameout, "w")
		nfilesread += 1
		for sline in eachline(fin)
			println(fout, sline)
		end # for sline
		close(fin)
		close(fout)
		nfileswritten += 1
	end # for fin

	# Write a diagnostic summary

	@printf("Number input files read:        %5d\n", nfilesread)
	@printf("Number output files backed up:  %5d\n", nfileswritten)
	println("Program bkupfiles has ended successfully.")
	println("End time:   ", now())

end # function main

# Execute

main()
