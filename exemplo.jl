2 + 3

f(x) = x

f(2)
f(3)

f.(2:0.1:3)

# ] -> pkg mode
# ctrl + C -> back to julia terminal

using Plots, DataFrames, XLSX
# p = joinpath(@__DIR__, "GC.xlsx")
xf = XLSX.readxlsx("data/GC - variáveis parte 1.xlsx")
xf
XLSX.sheetnames(xf)
sh = xf["Planilha1"]
sh

df = DataFrame(XLSX.readtable("data/GC - variáveis parte 1.xlsx", "Planilha1"))

m = XLSX.readdata(p, "Planilha1!A1:K29")

df
m
m = convert(Matrix{Float64}, m)

m = Matrix(sh)
transpose(m)