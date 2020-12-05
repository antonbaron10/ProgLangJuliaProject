# the purpose of using import:
## although you could always just do "using" import allows you to precompile your packages for use later
## this is similar to python in a way but Julia has a different syntax.
### 

import Pkg
Pkg.add("Plots")
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("HTTP")
Pkg.add("CSVFiles")
Pkg.add("CSV")

using Plots

plot(rand(5,5),linewidth = 2,title="simple plot")


x = 1:10
y = rand(10) # These are the plotting data
plot(x,y, label="my label")


using HTTP, DataFrames, CSV # load packages
r = HTTP.get("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")
d = HTTP.get("https://github.com/nytimes/covid-19-data/blob/master/us-states.csv")
url = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"


using CSVFiles, DataFrames
CSV.File(download(url))
d = download("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv","us-states.csv" )
f = CSV.File(d)

# load as a DF
df = DataFrame(load(d))

#Make an array of dates
dates = []
jan = 0; feb = 0; march = 0; april = 0; may = 0; june = 0; july = 0;august = 0; september = 0; october = 0; november = 0; december = 0;

months = []
for i = 1:num_rows
           date = df.date[i]
           push!(dates,date)
           # get the months of each point
           a = string(dates[i])

          # if month = jan , add a count to jan
          if a[6:7] == "01"
            global jan = jan + 1
          elseif a[6:7] == "02"
            global feb = feb + 1
          elseif a[6:7] == "03"
            global march = march + 1
          elseif a[6:7] == "04"
            global april = april + 1
          elseif a[6:7] == "05"
            global may = may + 1
          elseif a[6:7] == "06"
            global june = june + 1
          elseif a[6:7] == "07"
            global july = july + 1
          elseif a[6:7] == "08"
            global august = august + 1
          elseif a[6:7] == "09"
            global september = september + 1
          elseif a[6:7] == "10"
            global october = october + 1
          elseif a[6:7] == "10"
            global december = december + 1

           end
end
push!(months,jan)
push!(months,feb)
push!(months,march)
push!(months,april)
push!(months,may)
push!(months,june)
push!(months,july)
push!(months,august)
push!(months,september)
push!(months,october)
#push!(months,november)
#push!(months,december)



#dates[1] # still cant access 0 index. type is at 0 index

typeof(dates) # array
typeof(df) # dataFrame
dates[3]

x = months
l = [0,1,2,9,4,5]
y =  months # These are the plotting data
plot(x,y, label="my label")
