using DelimitedFiles
using Plots
using LaTeXStrings


matFull = readdlm("Presentation/generate_figures/error_exprk2_z0.csv", ',')

log2dt = matFull[1,2:end-1]
log2eps = matFull[2:end,1]
matErr = matFull[2:end, 2:end-1]


arrDt = 2.0.^-log2dt
arrEps = 2.0.^-log2eps
# matErr .= matErr ./ arrEps
nDt, nEps = length(arrDt), length(arrEps)

p1 = plot()
for iEps in 1:5:nEps
    plot!(arrDt, matErr[iEps,:], 
        label=L"\varepsilon = 2^{-%$(log2eps[iEps])}",
        marker=:auto, 
        legend=:bottomright
    )
end
xlabel!(L"\Delta t")
ylabel!(L"\mathrm{err}_{\infty}\ \mathrm{on}\ z")
plot!(arrDt, 0.1*arrDt.^2, linestyle=:dash, color=:grey, 
    label=L"C\: \Delta t ^2")
plot!(arrDt, 0.5*arrDt, linestyle=:dot, color=:grey, 
    label=L"C\: \Delta t")

p2 = plot()
for iDt in 1:4:nDt
    plot!(arrEps, matErr[:,iDt],
    label=L"\Delta t = 2^{-%$(log2dt[iDt])}",
    marker=:auto, legend=:bottomleft
    )
end
xlabel!(L"\varepsilon")


plotParam = Dict(
    :size => (360, 150),
    :layout => (1,2),
    :xaxis => :log10,
    :yaxis => :log10,
    :thickness_scaling => 0.25,
    :linewidth => 5,
    :markersize => 12,
    :legendfontsize => 20,
    :tickfontsize => 14,
    :labelfontsize => 20,
    :left_margin => 24Plots.mm,
    :bottom_margin => 16Plots.mm
)
plot(p1, p2; plotParam...)
savefig("toto.pdf")
# savefig("rk2_err_z.pdf")
