% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-caltech.R
\name{caltech256_dataset}
\alias{caltech256_dataset}
\title{Caltech-256 Dataset}
\usage{
caltech256_dataset(
  root = tempdir(),
  transform = NULL,
  target_transform = NULL,
  download = FALSE
)
}
\arguments{
\item{root}{Character. Root directory for dataset storage. The dataset will be stored under \code{root/caltech256}.}

\item{transform}{Optional function to transform input images after loading. Default is \code{NULL}.}

\item{target_transform}{Optional function to transform labels. Default is \code{NULL}.}

\item{download}{Logical. Whether to download the dataset if not found locally. Default is \code{FALSE}.}
}
\value{
An object of class \code{caltech256_dataset}, which behaves like a torch dataset.
Each element is a named list:
\describe{
\item{x}{A H x W x 3 integer array representing an RGB image.}
\item{y}{An Integer representing the label.}
}
}
\description{
Caltech-256 Dataset
}
\details{
Loads the Caltech-256 Object Category Dataset for image classification. It consists of 30,607 images across 256 distinct object categories.
Each category has at least 80 images, with variability in image size.
}
\examples{
\dontrun{
caltech256 <- caltech256_dataset(download = TRUE)

first_item <- caltech256[1]
first_item$x  # Image array
first_item$y  # Integer Label
}

}
