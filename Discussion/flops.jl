using BenchmarkTools

function η2(x,z,ε)
    ηxCoeffs = [
        64*x^12*z/9 + 8*x^6*z^3/3 ;
        88*x^10*z/9 + 4*x^4*z^3 ;
        68*x^8*z/9 + 4*x^5*z^2 + 2*x^2*z^3 ;
        6*x^6*z + 4*x^3*z^2 + z^3/3 ;
        13*x^4*z/3 - x*z^2 ;
        0 ;
        0
    ]
    ηzCoeffs = [
        -32*x^10*z^5/3 ;
        -80*x^8*z^5/3 ;
        -80*x^9*z^4/3 - 80*x^6*z^5/3 ;
        -160*x^7*z^4/3 - 40*x^4*z^5/3 ;
        -160*x^11*z^2/9 - 80*x^8*z^3/3 - 32*x^5*z^4 - 10*x^2*z^5/3 ;
        -52*x^9*z^2/3 - 40*x^6*z^3 - 16*x^3*z^4/3 - z^5/3 ;
        -448*x^13/81 - 268*x^7*z^2/9 - 16*x^4*z^3 + x*z^4/3 ;
        -32*x^11/9 - 59*x^5*z^2/3 - 10*x^2*z^3/3 ;
        -95*x^9/27 - 26*x^3*z^2/3 - z^3 ;
        0 ;
        0
    ]
    ηx, ηz = BigFloat(0), BigFloat(0)
    for xCoeff in ηxCoeffs
        ηx = ε*ηx + xCoeff
    end
    for zCoeff in ηzCoeffs
        ηz = ε*ηz + zCoeff
    end
    return [ηx;ηz]
end

function f(x,z)
    return (x^3/3 - z) * [BigFloat(1) ; x^2]
end

x,z,ε = BigFloat(5), BigFloat(1), BigFloat(1)

@btime $η2(x,z,ε)
@btime $f(x,z)

nothing