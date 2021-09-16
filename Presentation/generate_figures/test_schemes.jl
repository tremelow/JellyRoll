A = BigFloat.([0 0 ; 0 1])
expA = t -> BigFloat.([1 0 ; 0 exp(t)])
f = BigFloat.([-1 1 ; -1 1])
expf = t -> BigFloat.([ 1-t    t  ;  -t   1+t ])

u0 = BigFloat.([1,0])

#####################################
# PARAMETERS
T = 2^-2
ε = BigFloat(2)^-parse(Int64, ARGS[1])
N = Int( T * 2 ^ parse(Int64, ARGS[2]) )
t = range(BigFloat(0), BigFloat(T), length=N+1)
h = BigFloat(step(t))
# ε = BigFloat(2)^-3
# t = range(BigFloat(0), BigFloat(T), length=2^17+1)
# h = BigFloat(step(t))
#####################################

rε = (1 - sqrt(1 - 4*ε))/(2*ε)
P = BigFloat.([  -1        1 - rε     ; 
                  ε      1 - ε - ε*rε ])
invP = BigFloat.([ -1 + ε + ε*rε       1 - rε    ;
                        ε                1      ]) / sqrt(1 - 4*ε)
matFlow = invP * [exp(-h*rε) 0 ; 0  exp(-h/ε)*exp(h*rε)] * P
function exact_flow(u)
    invP * [exp(-h*rε) 0 ; 0  exp(-h/ε)*exp(h*rε)] * P * u
end


matStrang = expA(-0.5*h/ε) * expf(h) * expA(-0.5*h/ε)
function strang(u)
    expA(-0.5*h/ε) * expf(h) * expA(-0.5*h/ε) * u
end


hϕ1 = c -> [    h                   0            ; 
                0           ε/c * (1 - exp(-c*h/ε)) ]
hϕ2 = c -> [    h/2                     0                       ; 
                 0      ε/c*(1 - ε/(c*h) * (1 - exp(-c*h/ε)))   ]
c2 = BigFloat(0.5)
ha21 = c2*hϕ1(c2)
hb1 = hϕ1(1) - hϕ2(1)/c2
hb2 = hϕ2(1)/c2
function exp_rk1(u)
    expA(-h/ε)*u + hϕ1(1)*f*u
end
function exp_rk2(u)
    k1 = expA(-c2*h/ε)*u + ha21*f*u
    expA(-h/ε)*u + hb1*f*u + hb2*f*k1
end

imexExpA = c -> [   BigFloat(1)             0           ; 
                        0           1/(BigFloat(1) + c*h/ε) ]
function imex_bdf1(u)
    imexExpA(1)*(u + h*f*u)
end
function imex_bdf2(u1, u)
    a0, a1 = BigFloat(4)/3, -BigFloat(1)/3
    b0, b1 = BigFloat(4)/3, -BigFloat(2)/3
    c = BigFloat(2)/3
    imexExpA(c)*( a1*u1 + a0*u + h*b1*f*u1 + h*b0*f*u )
end

uRef, uNum = u0[:], u0[:]
uRef1, uNum1 = exact_flow(uRef), imex_bdf1(uNum)
uNumTmp = uNum1[:]
uRef  .= uRef1
uNum1 .= uNum
uNum  .= uNumTmp

err = abs.(uRef - uNum)
for _ in Iterators.drop(t,1)
    uRef .= exact_flow(uRef)

    # uNum .= exp_rk2(uNum)
    # uNum .= strang(uNum)
    uNumTmp .= imex_bdf2(uNum1, uNum)
    uNum1 .= uNum
    uNum .= uNumTmp

    err[1] = max(err[1], abs(uRef[1] - uNum[1]))
    err[2] = max(err[2], abs(uRef[2] - uNum[2]))
end

print(err[1])
print(" , ")