using PyPlot
using LaTeXStrings

x = collect(range(0.0, 3.0, length=2^8+1))

r = sqrt.(Complex.( 1.0 .- 4*x.^2 )) / 2.0
λp, λm = -0.5 .+ r, -0.5 .- r

subplots(figsize=(6,3.5))

## REAL 
subplot(111)

plot(x, real.(λp), color="gray", label="exact")
plot(x, real.(λp), color="tab:blue")
plot(x, real.(λm), color="tab:orange")

λpReal = -14*x.^10 - 5*x.^8 - 2*x.^6 - x.^4 - x.^2
λmReal = 14*x.^10 + 5*x.^8 + 2*x.^6 + x.^4 + x.^2 .- 1


ξ0, ξ1 = copy(x), copy(x)

α = 2
@. ξ0 = x^2 / (1 + α*x^2)
λpSmoo0 = -ξ0
λmSmoo0 = -1 .+ ξ0


λpReal = -ξ0 .* (1 .+ x.^2 .* (α .+ 1 ./ (1 .+ α*x.^2)))
λmReal =  -λpReal .- 1

plot(x, λpReal, color="gray", linestyle="dotted", label="direct approx.")
plot(x, λpReal, color="tab:blue", linestyle="dotted")
plot(x, λmReal, color="tab:orange", linestyle="dotted")




plot(x, λpSmoo0, color="gray", linestyle="dashed", label="order 0")
plot(x, λpSmoo0, color="tab:blue", linestyle="dashed")
plot(x, λmSmoo0, color="tab:orange", linestyle="dashed")


α = 4
@. ξ0 = x^2 / (1 + α*x^2)
@. ξ1 = ξ0 * (1 + ξ0 * (α + 1/(1 + α*x^2)))
λpSmoo1 = -ξ1
λmSmoo1 = -1 .+ ξ1

plot(x, λpSmoo1, color="gray", linestyle="dashdot", label="order 1")
plot(x, λpSmoo1, color="tab:blue", linestyle="dashdot")
plot(x, λmSmoo1, color="tab:orange", linestyle="dashdot")

xlabel(L"\varepsilon\xi")
ylabel(L"\varepsilon^2 \mathrm{Re}(\lambda)")
ylim(-1.2, 0.2)
scatter(0.5, -0.5, marker="o", color="tab:red")
xticks(fontsize=8)
yticks(fontsize=8)

legend(fontsize=9)


## IMAG
# subplot(122)

# plot(x, imag.(λp), color="tab:blue")
# plot(x, imag.(λm), color="tab:orange")

# λpImag = x - 1 ./(8*x) - 1 ./(128*x.^3) - 1 ./(1024*x.^5) - 5*1 ./(32768*x.^7)
# λmImag = -x + 1 ./(8*x) + 1 ./(128*x.^3) + 1 ./(1024*x.^5) + 5*1 ./(32768*x.^7)

# @. λpImag = 0.0
# @. λmImag = 0.0

# plot(x, λpImag, color="tab:blue", linestyle="dashed")
# plot(x, λmImag, color="tab:orange", linestyle="dashed")

# xlabel(L"\varepsilon\xi")
# ylabel(L"\varepsilon^2 \mathrm{Im}(\lambda)")
# ylim(-1.1, 1.1)
# scatter(0.5, 0.0, marker="o", color="tab:red")
# xticks(fontsize=8)
# yticks(fontsize=8)


tight_layout()
