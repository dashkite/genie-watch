import * as M from "@dashkite/masonry"
import * as W from "@dashkite/masonry-watch"

idle = do ( _idle = true ) ->
  ( f ) ->
    ( args... ) ->
      if _idle
        _idle = false
        await f args...
        _idle = true

export default ( Genie ) ->

  Genie.on "watch", M.start [
    W.glob glob: "{src,test}/**/*"
    idle ->
      try
        await Genie.run "build"
      catch error
        Genie.log.error error
  ]

  