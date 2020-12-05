using Pkg
Pkg.activate("Plots")
Pkg.activate("CSV")
Pkg.activate("DataFrames")
Pkg.activate("HTTP")
Pkg.activate("CSVFiles")


using CSVFiles, DataFrames,CSV
CSV.File(download(url))
d = download("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv","us-states.csv" )
f = CSV.File(d)

# load as a DF
df = DataFrame(load(d))
