% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-eurosat.R
\name{eurosat_dataset}
\alias{eurosat_dataset}
\alias{eurosat_all_bands_dataset}
\alias{eurosat100_dataset}
\title{EuroSAT Dataset}
\usage{
eurosat_dataset(
  root,
  split = "train",
  download = FALSE,
  transform = NULL,
  target_transform = NULL
)

eurosat_all_bands_dataset(
  root,
  split = "train",
  download = FALSE,
  transform = NULL,
  target_transform = NULL
)

eurosat100_dataset(
  root,
  split = "train",
  download = FALSE,
  transform = NULL,
  target_transform = NULL
)
}
\arguments{
\item{root}{(Optional) Character. The root directory where the dataset will be stored.
if empty, will use the default \code{rappdirs::user_cache_dir("torch")}.}

\item{split}{Character. Must be one of \code{train}, \code{val}, or \code{test}.}

\item{download}{Logical. If \code{TRUE}, downloads the dataset rows from the API if not already present.}

\item{transform}{Function. Optional transformation to be applied to the images.}

\item{target_transform}{Function. Optional transformation to be applied to the labels.}
}
\value{
A \code{torch::dataset} object named x and y with x, a 64x64 image with 3 or 13 layers, and y, the label .
}
\description{
Downloads and prepare the EuroSAT dataset from Hugging Face datasets.
The dataset consists of Land Use and Land Cover Classification with Sentinel-2
satellite images. Images are openly and freely made available by the Earth
observation program Copernicus. Images are organized into 10 classes.
}
\details{
\code{eurostat_dataset()} provides a total of 27,000 RGB labeled images.

\code{eurosat_all_bands_dataset()} provides a total of 27,000 labeled images with 13 spectral channel bands.

\code{eurosat100_dataset()} provides a subset of 100 labeled images with 13 spectral channel bands, intended for workshops and demos.
}
\examples{
\dontrun{
# Initialize the dataset
ds <- eurosat100_dataset(split = "train", download = TRUE)

# Access the first item
head <- ds[1]
print(head$x) # Image
print(head$y) # Label
}
}
