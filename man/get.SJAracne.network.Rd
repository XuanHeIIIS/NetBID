% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipeline_functions.R
\name{get.SJAracne.network}
\alias{get.SJAracne.network}
\title{Read SJARACNe Network Result and Return it as List Object}
\usage{
get.SJAracne.network(network_file = NULL)
}
\arguments{
\item{network_file}{character, the path for storing network file. For the output of SJAracne, the name of the network file will be "consensus_network_ncol_.txt" under the output directory.}
}
\value{
Return a list containing three elements, \code{network_dat}, \code{target_list} and \code{igraph_obj}.
}
\description{
\code{get.SJAracne.network} reads SJARACNe network construction result and returns a list object
with network data frame, driver-to-target list and igraph object wrapped inside.
}
\details{
In the demo, "consensus_network_ncol_.txt" file will be read and convert into a list object.
This list contains three elements, \code{network_data}, \code{target_list} and \code{igraph_obj}.
\code{network_dat} is a data.frame, contains all the information of the network SJARACNe constructed.
\code{target_list} is a driver-to-target list object. Please check details in \code{get_net2target_list}.
\code{igraph_obj} is an igraph object used to save this directed and weighted network.
Each edge of the network has two attributes, \code{weight} and \code{sign}.
\code{weight} is the "MI (mutual information)" value and \code{sign} is the sign of the spearman
correlation coefficient (1, positive regulation; -1, negative regulation).
}
\examples{
if(exists('analysis.par')==TRUE) rm(analysis.par)
network.dir <- sprintf('\%s/demo1/network/',system.file(package = "NetBID2")) # use demo
network.project.name <- 'project_2019-02-14' # demo project name
project_main_dir <- 'test/'
project_name <- 'test_driver'
analysis.par  <- NetBID.analysis.dir.create(project_main_dir=project_main_dir,
                                            project_name=project_name,
                                            network_dir=network.dir,
                                            network_project_name=network.project.name)
analysis.par$tf.network  <- get.SJAracne.network(network_file=analysis.par$tf.network.file)
analysis.par$sig.network <- get.SJAracne.network(network_file=analysis.par$sig.network.file)

\dontrun{
}
}
