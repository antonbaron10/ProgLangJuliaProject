# quick note... this is all run after running dv.jl first and then restarting the Julia session. 
## Must have messed something up with how packages are used/added/loaded so this one can be buggy
# will attatch screenshots since it has a hard time running sometimes


# import Pkg # do this if you want to run file on its own
using Pkg



Pkg.add("GR")
Pkg.add("RDatasets")
Pkg.activate("CSV")
Pkg.activate("Plots")
#import GLFW

# Can't use any packages without saying using

# here's an alternative to the "using method", instead of staying "Using GR", you can use "GR."
# this is nice bc it's more reminicent of other GPLs
using GR,RDatasets,CSV
# need to use .GR here with "using GR" the way we're running dv.jl before other packages....
# it seems some methods belong to multiple packages or can be confused by the compiler. histogram is apparently one of them
GR.histogram(randn(10000))


# loading the dataset 
  
cars = dataset("datasets", "mtcars") 
  
# plotting bar graph 
Plots.bar(cars.Model, 
    cars.MPG, 
    label = "Miles/Gallon", 
    title = "Models and Miles/Gallon", 
    xticks =:all, 
    xrotation = 45, 
    size = [600, 400], 
    legend =:topleft)
