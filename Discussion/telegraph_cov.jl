using PyPlot
using LaTeXStrings


x = range(0.0, 1.0, length=2^8+1)
det0 = -x.^2 .* (14*x.^8 + 5*x.^6 + 2*x.^4 + x.^2 .+ 1).^2 .+ 1
detInf = (4096*x.^6 - 256*x.^4 - 32*x.^2 .- 1) ./ (2048*x.^6)

plot(x,det0)
plot(x,detInf)
plot(x, exp.(-4*x.^2).*det0 + (1 .- exp.(-4*x.^2)).*detInf)

ylim(0.0, 2.0)