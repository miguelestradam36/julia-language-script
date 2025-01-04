# JULIA SCRIPT
## Project based on the working examples from University of Cape Town (Julia Scientific Programming course from Coursera)
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
Pkg.add("ORCA")
Pkg.add("GR")
Pkg.add("Dates")
Pkg.add("Plots")
# OPTIONAL: You can run those installments on the Julia CLI, in order to improve the time execution of the script

# Once the packages are on file
using Distributions
using DataFrames
using DelimitedFiles
using StatsPlots
using HypothesisTests
using GLM 
using Plots
using CSV
using Dates

#------------------------------------------------------------
# Global variables
wikiEVDraw = ""
col1 = ""

#----------------------------------------------------
#Load the data from a CSV file
try
    wikiEVDraw = DelimitedFiles.readdlm("wikipediaEVDraw.csv", ',')  # getting quotes right is important!
    println("CSV file information has been uploaded...")
catch
    println("It was not possible to get the information...")
end

#-------------------------
# Creating another day format and including it
try
    #Modify or work with the data
    Dates.DateTime(wikiEVDraw[1,1], "d u y")
    col1 = wikiEVDraw[:, 1]
    for i = 1:length(col1)
        col1[i] = Dates.DateTime(col1[i], "d u y")  # note that this replaces the previous value in col1[i]
    end
    Dates.datetime2rata(col1[1])
    dayssincemar22(x) = Dates.datetime2rata(x) - Dates.datetime2rata(col1[54])
    epidays = Array{Int64}(undef,54)
    for i = 1:length(col1)
        epidays[i] = dayssincemar22(col1[i])
    end
    wikiEVDraw[:, 1] = epidays
    #----------------------------
    # Creating plots based on the data
    try
        gr()
        epidays = wikiEVDraw[:, 1]  # Here ":" means all the entries in all rows of the specified columns
        allcases = wikiEVDraw[:, 2] # ditto---here, the specified columns is just column 2
        Plots.plot(epidays, allcases,   # here are the data to be plotted, below are the attributes
        title       = "West African EVD epidemic, total cases", 
        xlabel    = "Days since 22 March 2014",
        ylabel    = "Total cases to date (three countries)",
        marker  = (:diamond, 8),  # note the use of  parentheses to group the marker attributes into a composite of attributes 
                                  # and because we plot both the path and the points, we use plot rather than scatter
        line         = (:path, "gray"),   # line attributes likewise put together as one unit by the use of parantheses
        legend   = false,
        grid        = false)    
        
        # A nice thing: this layout permits us add comments to individual parts of  the function call. 
        # Also, notice that it helps readibility to line up vertically all the assignment "=" signs
        Plots.savefig("WAfricanEVD.pdf")      # Saved as a pdf
        Plots.savefig("WAfricanEVD.png")     # Saved png format
    catch
        println("Not possible to save a plot of the information...")
    end
    #----------------------------
catch
    println("Not possible to make date conversion...")
end
#----------------------------

#----------------------------------------------------
#Save data into a CSV file
try
    DelimitedFiles.writedlm("wikipediaEVDraw_DATE_TYPE_CHANGE.csv", wikiEVDraw, ',') #note the delimiter ... the Julia default is a tab; to get .csv, we must specify the comma
    println("Information has been saved in another CSV file...")
catch
    println("It was not possible to save the information...")
end