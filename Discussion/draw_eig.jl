using PyPlot
using LaTeXStrings

x = range(0.0, 1.0, length=2^8+1)

r = sqrt.(Complex.( 1.0 .- 4*x.^2 )) / 2.0
λp, λm = -0.5 .+ r, -0.5 .- r

subplots(figsize=(7,3))

## REAL 
subplot(121)

plot(x, real.(λp), color="tab:blue")
plot(x, real.(λm), color="tab:orange")

λpReal = -14*x.^10 - 5*x.^8 - 2*x.^6 - x.^4 - x.^2
λmReal = 14*x.^10 + 5*x.^8 + 2*x.^6 + x.^4 + x.^2 .- 1

plot(x, λpReal, color="tab:blue", linestyle="dashed")
plot(x, λmReal, color="tab:orange", linestyle="dashed")

xlabel(L"\varepsilon\xi")
ylabel(L"\mathrm{Re}(\lambda)")
ylim(-1.1, 0.1)
scatter(0.5, -0.5, marker="o", color="tab:red")
xticks(fontsize=8)
yticks(fontsize=8)


## IMAG
subplot(122)

plot(x, imag.(λp), color="tab:blue")
plot(x, imag.(λm), color="tab:orange")

λpImag = x - 1 ./(8*x) - 1 ./(128*x.^3) - 1 ./(1024*x.^5) - 5*1 ./(32768*x.^7)
λmImag = -x + 1 ./(8*x) + 1 ./(128*x.^3) + 1 ./(1024*x.^5) + 5*1 ./(32768*x.^7)

plot(x, λpImag, color="tab:blue", linestyle="dashed")
plot(x, λmImag, color="tab:orange", linestyle="dashed")

xlabel(L"\varepsilon\xi")
ylabel(L"\mathrm{Im}(\lambda)")
ylim(-1.1, 1.1)
scatter(0.5, 0.0, marker="o", color="tab:red")
xticks(fontsize=8)
yticks(fontsize=8)


tight_layout()