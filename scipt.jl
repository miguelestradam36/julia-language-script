# JULIA SCRIPT
# OPTIONAL: You can run those installments on the Julia CLI, in order to improve the time execution of the script
# Make sure the needed file is there
import Pkg
Pkg.add("DelimitedFiles")
Pkg.add("Distributions")
Pkg.add("StatsBase")
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("HypothesisTests")
Pkg.add("StatsPlots")
Pkg.add("GLM")
Pkg.add("GR")
# OPTIONAL: You can run those installments on the Julia CLI, in order to improve the time execution of the script

# Once the packages are on file
using Distributions
using DataFrames
using StatsPlots
using HypothesisTests
using GLM 
using ORCA
using Plots
using DelimitedFiles
using CSV

# Define a function
function analyze_dataframe(dataframe)
    
end

#Load the data from a CSV file
wikiEVDraw = DelimitedFiles.readdlm("wikipediaEVDraw.csv", ',')  # getting quotes right is important!
println("CSV file information has been uploaded...")

# TODO
gr()                   # Use GR Backend


#Save data into a CSV file
DelimitedFiles.writedlm("FileName.csv", wikiEVDraw, ',')
println("Information has been saved in another CSV file...")