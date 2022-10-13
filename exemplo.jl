2 + 3

f(x) = x

f(2)
f(3)

f.(2:0.1:3)

# ] -> pkg mode
# ctrl + C -> back to julia terminal

using Plots, DataFrames, XLSX, Statistics
p = joinpath(@__DIR__, "GC.xlsx")
xf = XLSX.readxlsx("GC.xlsx")
xf
XLSX.sheetnames(xf)
sh = xf["Planilha1"]
sh

df = DataFrame(XLSX.readtable("GC.xlsx", "Planilha1"))


m = XLSX.readdata(p, "Planilha1!A1:K29")

df
f(x) = x + 2


(df[:,:])

df

permutedims(df, 1)



df = Float64.(df)


t

