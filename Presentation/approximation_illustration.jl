using Plots
using LaTeXStrings

T = pi
eps = 1.0
z0 = 1.0


function centerManifold(t)
    eps*(sin(t) - eps*cos(t))/(1+eps^2)
end
shadowData = z0 + eps^2/(1+eps^2)
function exactSol(t)
    exp(-t/eps)*shadowData + centerManifold(t)
end


tDiscrete = range(0.0, T, length=11)
h = step(tDiscrete)
function implEuler(t,z)
    eps*(z + h*sin(t))/(h+eps)
end

zExact = exactSol.(tDiscrete)
zApprox = [z0 for _ in tDiscrete]
for (n,t) in enumerate(tDiscrete[1:end-1])
    zApprox[n+1] = implEuler(t, zApprox[n])
end


plot(size=(550,250))
cExact, cApprox = palette(:tab10)[1:2]

scatter!(tDiscrete, zExact, marker=:auto, markersize=5, color=cExact)
plot!(tDiscrete, zApprox, marker=:auto, color=cApprox)

tSmooth = range(0.0, T, length=129)
zSmooth = exactSol.(tSmooth)
plot!(tSmooth, zSmooth, color=cExact)

plot!(legend=:none, xlabel=L"t", ylabel=L"z(t)", labelfontsize=14)
savefig("approx_sin.pdf")
