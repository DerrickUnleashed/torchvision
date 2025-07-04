% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ops-boxes.R
\name{batched_nms}
\alias{batched_nms}
\title{Batched Non-maximum Suppression (NMS)}
\usage{
batched_nms(boxes, scores, idxs, iou_threshold)
}
\arguments{
\item{boxes}{(Tensor[N, 4]): boxes where NMS will be performed. They are expected to be
in \eqn{(x_{min}, y_{min}, x_{max}, y_{max})} format with
\itemize{
\item \eqn{0 \leq x_{min} < x_{max}} and
\item \eqn{0 \leq y_{min} < y_{max}}.
}}

\item{scores}{(Tensor[N]): scores for each one of the boxes}

\item{idxs}{(Tensor[N]): indices of the categories for each one of the boxes.}

\item{iou_threshold}{(float): discards all overlapping boxes with IoU > \code{iou_threshold}}
}
\value{
keep (Tensor): int64 tensor with the indices of
the elements that have been kept by NMS, sorted
in decreasing order of scores
}
\description{
Performs non-maximum suppression in a batched fashion.
Each index value correspond to a category, and NMS
will not be applied between elements of different categories.
}
