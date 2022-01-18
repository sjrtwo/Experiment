#=  Name:       interval.jl
    Programmer: Steve Rock
 	Date:		01/09/2021
 	Comments:	This file defines structures and functions
				that will be used to set up an interval type.
=#

using Printf

function print_num(parm_num::Int)
    return @sprintf("%d", parm_num)
end
function print_num(parm_num::Real)
    return @sprintf("%0.6e", parm_num)
end
function throw_arg_err(parm_low::Number, parm_high::Number, parm_delta::Number)
    if parm_low >= parm_high
        s_msg = "low=" * print_num(parm_low) * " is greater than or equal to "
        s_msg *= "high=" * print_num(parm_high) * "."
        throw(ArgumentError(s_msg))
    end
    if parm_delta > (parm_high - parm_low)
        s_msg = "delta=" * print_num(parm_delta) * "."
        s_msg *= "is greater than the difference between "
        s_msg *= "high=" * print_num(parm_high) * " and "
        s_msg *= "low=" * print_num(parm_low) * " "
        throw(ArgumentError(s_msg))
    end
end

struct Interval
    low::Number
    high::Number
    delta::Number
    Interval(low, high, delta) =
      low > high || delta > (high - low) ?
        throw_arg_err(low, high, delta) :
        new(low, high, delta)
end
