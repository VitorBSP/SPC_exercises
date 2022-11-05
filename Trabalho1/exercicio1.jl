using Plots, DataFrames, XLSX, Statistics
df = DataFrame(XLSX.readtable("data/GC - variáveis parte 1.xlsx", "Planilha1"))

mean_line = mean.(eachrow(df))
mean_of_mean_line = mean(mean_line)

n = nrow(df)
min_max = extrema.(eachrow(df))
# min_line = minimum.(eachrow(df))
# max_line = maximum.(eachrow(df))

amplitude = []
for (min, max) in min_max
    append!(amplitude, [max - min])
end

amplitude

amplitude_media = mean(amplitude)

sd_line = std.(eachrow(df))
sd_line

sd_media = mean(sd_line)


# Gráficos da Amplitude

# Para média

A_2 = 0.153
lim_superior = mean_of_mean_line + (A_2*amplitude_media)
lim_inferior = mean_of_mean_line - (A_2*amplitude_media)
lim_inferior
colorcond(x) = lim_inferior.<x.<lim_superior ? :black : :red
#plot(mean_line, seriestype = :scatter, title = "My Scatter Plot")
gr(size = (800,600))
scatter(mean_line, legend = false, color = colorcond.(mean_line))
#ifelse.((mean_line .< lim_inferior .& mean_line .> lim_superior), "#CA3C32", "#222222"))
hline!([mean_of_mean_line, lim_inferior, lim_superior])

# Para o desvio padrão

d4 = 1.541
d3 = 0.459
lim_superior = d4*amplitude_media
lim_inferior = d3*amplitude_media

scatter(amplitude, legend = false, color = colorcond.(amplitude))
hline!([amplitude_media, lim_inferior, lim_superior])

# Gráficos do desvio padrão

# Para a média

c4 = 4*(n-1)/(4*n-3)
a3 = 3/(c4*sqrt(n))
lim_superior = mean_of_mean_line + (a3*sd_media)
lim_inferior = mean_of_mean_line - (a3*sd_media)

scatter(mean_line, legend = false, color = colorcond.(mean_line))
hline!([mean_of_mean_line, lim_inferior, lim_superior])

# Para o sd

d4 = round(3/(c4*sqrt(2*(n-1))),digits = 3)
b3 = 1 - d4
b4 = 1 + d4
lim_superior = b4*sd_media
lim_inferior = b3*sd_media

scatter(sd_line, legend = false, color = colorcond.(sd_line))
hline!([sd_media, lim_inferior, lim_superior])



A_2 = 0.153
lim_superior_amplitude = mean_of_mean_line + (A_2*amplitude_media)
lim_inferior_amplitude = mean_of_mean_line - (A_2*amplitude_media)

c4 = 4*(n-1)/(4*n-3)
a3 = 3/(c4*sqrt(n))
lim_superior_sd = mean_of_mean_line + (a3*sd_media)
lim_inferior_sd = mean_of_mean_line - (a3*sd_media)

colorcond(x) = ifelse(lim_inferior_amplitude.<x.<lim_superior_amplitude, 
                    ifelse(lim_inferior_sd.<x.<lim_superior_sd,:black,:red), 
                    ifelse(lim_inferior_sd.<x.<lim_superior_sd,:orange,:red))
gr(size = (800,600))
scatter(mean_line, legend = false, color = colorcond.(mean_line))
hline!([mean_of_mean_line, lim_superior_amplitude, lim_inferior_amplitude])
hline!([lim_superior_sd, lim_inferior_sd])
 