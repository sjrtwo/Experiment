#=  Name:       interval.jl
    Programmer: Steve Rock
 	Date:		01/09/2021
 	Comments:	This file defines structures and functions
				that will be used to set up an interval type.
=#

struct Interval
    low::Number
    high::Number
    delta::Number
#    local ntrvl::Interval = new(low::Number, high::Number, delta::Number)
#    validate_interval(ntrvl)
end

function validate_interval(parm_interval::Interval)
    if parm_interval.low >= parm_interval.high
        s_msg = "low=" * parm_interval.low * " is not less than "
        s_msg *= ("high=" * parm_interval.high * ".")
        throw(ArgumentError(s_msg))
    end
    if (parm_interval.high - parm_interval.low) > parm_interval.delta
        s_msg = "difference between "
        s_msg *= ("high=" * parm_interval.high * " and ")
        s_msg *= ("low=" * parm_interval.low * " ")
        s_msg *= "is greater than "
        s_msg *= ("delta=" * parm_interval.delta * ".")
        throw(ArgumentError(s_msg))
    end
    return(parm_interval)
end
