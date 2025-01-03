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

# Define a function
function someaction(testvar)
    //
end

#Load the data from a CSV file
using DelimitedFiles
wikiEVDraw = DelimitedFiles.readdlm("wikipediaEVDraw.csv", ',')  # getting quotes right is important!
println("CSV file information has been uploaded...")

# TODO
gr()                   # Use GR Backend


#Save data into a CSV file
DelimitedFiles.writedlm("FileName.csv", wikiEVDraw, ',')
println("Information has been saved in another CSV file...")