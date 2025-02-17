% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/board_rsconnect.R
\name{board_rsconnect}
\alias{board_rsconnect}
\title{Use an RStudio Connect board}
\usage{
board_rsconnect(
  auth = c("auto", "envvar", "rsconnect"),
  server = NULL,
  account = NULL,
  key = NULL,
  output_files = FALSE,
  cache = NULL,
  name = "rsconnect",
  versions = TRUE,
  ...
)
}
\arguments{
\item{auth}{There are two approaches to auth: you can either use \code{"envvars"}
\code{CONNECT_API_KEY} and \code{CONNECT_SERVER} or the rsconnect package. The
default is \code{auto}, which will use the environment variables if both are
available, and rsconnect if not.}

\item{server}{For \code{auth = "envvar"} the full url to the server.
For \code{auth = 'rsconnect'} a host name used to disambiguate RSC accounts.}

\item{account}{A user name used to disambiguate multiple RSC accounts}

\item{key}{The RStudio Connect API key.}

\item{output_files}{`r lifecycle::badge("deprecated") No longer supported.}

\item{cache}{Cache path. Every board requires a local cache to avoid
downloading files multiple times. The default stores in a standard
cache location for your operating system, but you can override if needed.}

\item{name}{An optional name used identify the board. This is no longer
generally needed since you should be passing around an explicit
board object.}

\item{versions}{Should this board be registered with support for versions?}

\item{...}{Additional parameters required to initialize a particular board.}
}
\description{
To use a RStudio Connect board, you need to first authenticate. The easiest
way to do so is by launching \strong{Tools} - \strong{Global Options} -
\strong{Publishing} - \strong{Connect}, and follow the instructions.

You can share pins with others in RStudio Connect by changing the viewers
of the document to specific users or groups. This is accomplished by opening
the new published pin and then changing access under the settings tab.
After you've shared the pin, it will be automatically available to others.
}
\section{Public pins}{
If your RSC instance allows it, you can share a pin publicly by setting the
access type to \code{all}:\if{html}{\out{<div class="r">}}\preformatted{board \%>\% pin_write(my_df, access_type = "all")
}\if{html}{\out{</div>}}

(You can also do this in RSC by setting "Access" to
"Anyone - no login required")

Now anyone can read your pin through \code{\link[=board_url]{board_url()}}:\if{html}{\out{<div class="r">}}\preformatted{board <- board_url(c(
  my_df = "https://connect.rstudioservices.com/content/3004/"
))
board \%>\% pin_read("my_df")
}\if{html}{\out{</div>}}

You can find the URL of a pin with \code{\link[=pin_browse]{pin_browse()}}.
}

\examples{
\dontrun{
board <- board_rsconnect()
# Share the mtcars with your team
board \%>\% pin_write(mtcars, "mtcars")

# Download a shared dataset
board \%>\% pin_read("timothy/mtcars")
}
}
\seealso{
Other boards: 
\code{\link{board_azure}()},
\code{\link{board_folder}()},
\code{\link{board_github}()},
\code{\link{board_s3}()}
}
\concept{boards}
