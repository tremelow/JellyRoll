using DelimitedFiles
using PyPlot
using LaTeXStrings
using CircularArrays


matFull = readdlm("error_custom_z.csv", ',')
fileName = "../custom_err_z.pdf"

log2dt = matFull[1,2:end-1]
log2eps = matFull[2:end,1]
matErr = Float64.(matFull[2:end, 2:end-1])


ymarkers = CircularArray(["D", "o", "s", "^", "p", "v"])

arrDt = 2.0.^-log2dt
arrEps = 2.0.^-log2eps
# matErr .= matErr ./ arrEps
nDt, nEps = length(arrDt), length(arrEps)

subplots(figsize=(7,3))

subplot(121)
for iEps in 1:5:nEps
    loglog(arrDt, matErr[iEps,:], 
        label=L"\varepsilon = 2^{-%$(log2eps[iEps])}",
        marker=ymarkers[div(iEps,6)+1]
    )
end
xlabel(L"\Delta t")
ylabel(L"\mathrm{err}_{\infty}\ \mathrm{on}\ z")
loglog(arrDt, arrDt.^2, linestyle="dashed", color="grey", 
    label=L"C\: \Delta t ^2")
loglog(arrDt, 0.5*arrDt, linestyle="dotted", color="grey", 
    label=L"C\: \Delta t")
# loglog(arrDt, 0.000001*arrDt .^-1, linestyle="dotted", color="grey", 
#     label=L"C\: \Delta t")

xticks(fontsize=8)
yticks(fontsize=8)
legend(fontsize=9)


subplot(122)
for iDt in 1:4:nDt
    loglog(arrEps, matErr[:,iDt],
    label=L"\Delta t = 2^{-%$(log2dt[iDt])}",
    marker=ymarkers[div(iDt,4)+1]
    )
end
xlabel(L"\varepsilon")
xticks(fontsize=8)
yticks(fontsize=8)
legend(fontsize=9)




tight_layout()
savefig(fileName)
