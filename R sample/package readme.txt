All the code I have written in R so far belongs to EIU. However I can share a readme I wrote for a package of R functions:

# EIUhealthcarePackage
 
This is a package with functions for data manipulation, export, reporting and QC.

To install the package:

  install.packages("devtools")
  library(devtools)
  # ignore warnings about Rtools, shouldn't be necessary to install
  Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
  devtools::install_github("<github folder>/<package name>", auth_token = "<instert token>")

To add a new function please, consider the following notes:

when you create a function, which needs  function from a external package you need to call them using the "double colon approach" (for instance: dplyr::select), never use the library() command. The latter could affect the import of the function. Do not forget to make sure that this package is listed in the "DESCRIPTION" file. 

The second option is to make use of the command @importFrom at the beggining of the function, for instance:

#' @importFrom excel.link xlc xlrc

in this way you can use the function without the double colon aproach.

there are two approaches to set the default values in functions.

	LSmergeother <- function(data,var,delete,stringcopy) {
  		if(missing(delete)) delete <- FALSE
  		  ...

and

	LSmergeother <- function(data = NULL,var= NULL,delete = NULL,stringcopy= NULL) {
  		if(is.null(delete)) delete <- False
  		  ...

I think is better to unify this style into the latter approach since the default value will automatically show up in the documentation in this way.

Do not forget to add comments to the function in the ROxygen2 format which is as follows:

	#' title
	#'
	#' description
	#' @param <parametername> <parameter description> #(both parameter description and name are mandatory in all the parameters in order for roxygen2 to work
                                                    # the standard description I used was: <optional in case it`s an optional parameter>,<type of parameter(string, numeric, vector of strings...)>, <description> 
	#'
	#' @examples
	#'\dontrun{  #(this is neccesary in order to run the CMD check, otherwise will rise a an error like @example 'F:\...' doesn't exist
	#' <some example>
	#'}
	#' @export
  

It is better not to use special characters in the title and the description. There are three special characters that need special handling if you want them to appear in the final documentation:
    @, which usually marks the start of a roxygen tag. Use @@ to insert a literal @ in the final documentation.
    %, which usually marks the start of a latex comment which continues to the end of the line. Use \% to insert a literal % in the output document. The escape is not needed in examples.
    \, which usually marks the start of a latex escaping. Use \\ to insert a literal \ in the documentation.
    
    For more details about special characters and Roxygen2 comments see https://github.com/r-lib/roxygen2/issues/654
    
if you used any package not listed in the DESCRIPTION file under "Imports:" you must add it.

To finish, you must rebuild the package:

  1 make sure you saved all the files you modified 
  2 open the package R Project (.Rproj file)
  3 generate the documentation: in rstudio type devtools::document() (It is common that some errors arise, correct them and run again)
  4 build the package: in Rstudio Build-> Install and restart (old version Build and reload)
  5 stage all the new files in the git tab (in case they are too many files you may not be able to stage them, manually. Go to the terminal tab and type git add -A to stage all the files)
  6 commit and push ("git push origin master" form the terminal or hit push in the git tab) so the modifications are available to all users




