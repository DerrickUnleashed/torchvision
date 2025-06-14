% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-fgvc.R
\name{fgvc_aircraft_dataset}
\alias{fgvc_aircraft_dataset}
\title{FGVC Aircraft dataset}
\usage{
fgvc_aircraft_dataset(
  root = tempdir(),
  split = "train",
  annotation_level = "variant",
  transform = NULL,
  target_transform = NULL,
  download = FALSE
)
}
\arguments{
\item{root}{Character. Root directory for dataset storage. The dataset will be stored under \verb{root/fgvc-aircraft-2013b}.}

\item{split}{Character. One of \code{"train"}, \code{"val"}, \code{"trainval"}, or \code{"test"}. Default is \code{"train"}.}

\item{annotation_level}{Character. Level of annotation to use for classification. Default is \code{"variant"}.
One of \code{"variant"}, \code{"family"}, or \code{"manufacturer"}. See \emph{Details}.}

\item{transform}{Optional function to transform input images after loading. Default is \code{\link[=transform_to_tensor]{transform_to_tensor()}}.}

\item{target_transform}{Optional function to transform labels.}

\item{download}{Logical. Whether to download the dataset if not found locally. Default is \code{FALSE}.}
}
\value{
An object of class \code{fgvc_aircraft_dataset}, which behaves like a torch-style dataset.
Each element is a named list with:
\itemize{
\item \code{x}: a torch tensor of the image with shape (C x H x W). Please note that images have varying sizes.
\item \code{y}: an integer class label corresponding to the selected \code{annotation_level}.
}

The dataset supports standard dataset operations like indexing (\code{dataset[i]}) and length (\code{length(dataset)}).
}
\description{
FGVC Aircraft Dataset
}
\details{
The FGVC-Aircraft dataset supports the following official splits:
\itemize{
\item \code{"train"}: training subset
\item \code{"val"}: validation subset
\item \code{"trainval"}: combined training and validation set
\item \code{"test"}: test set with labels (used for evaluation)
}

The \code{annotation_level} determines the granularity of labels used for classification and supports three values:
\itemize{
\item \code{"variant"}: the most fine-grained level, e.g., \code{"Boeing 737-700"}. There are 100 visually distinguishable variants.
\item \code{"family"}: a mid-level grouping, e.g., \code{"Boeing 737"}, which includes multiple variants. There are 70 distinct families.
\item \code{"manufacturer"}: the coarsest level, e.g., \code{"Boeing"}, grouping multiple families under a single manufacturer. There are 30 manufacturers.
}

These levels form a strict hierarchy: each \code{"manufacturer"} consists of multiple \code{"families"}, and each \code{"family"} contains several \code{"variants"}.
Not all combinations of levels are valid — for example, a \code{"variant"} always belongs to exactly one \code{"family"}, and a \code{"family"} to exactly one \code{"manufacturer"}.
}
\examples{
\dontrun{
fgvc <- fgvc_aircraft_dataset( split = "train", annotation_level = "variant", download = TRUE )

# Define a custom collate function to resize images in the batch
resize_collate_fn <- function(batch) {
  xs <- lapply(batch, function(sample) {
    torchvision::transform_resize(sample$x, c(768, 1024))
  })
  xs <- torch::torch_stack(xs)
  ys <- torch::torch_tensor(sapply(batch, function(sample) sample$y), dtype = torch::torch_long())
  list(x = xs, y = ys)
}

dl <- torch::dataloader( dataset = fgvc, batch_size = 2, collate_fn = resize_collate_fn )
batch <- dataloader_next(dataloader_make_iter(dl))
batch$x  # batched image tensors resized to 768x1024
batch$y  # class labels
}

}
