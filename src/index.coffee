import * as M from "@dashkite/masonry"
import * as W from "@dashkite/masonry-watch"

export default ( Genie ) ->

  Genie.on "watch", M.start [
    W.glob glob: "{src,test}/**/*"
    -> Genie.run "build!"
  ]

  