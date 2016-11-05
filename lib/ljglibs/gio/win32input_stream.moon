-- Copyright 2014-2015 The Howl Developers
-- License: MIT (see LICENSE.md at the top-level directory of the distribution)

require 'ljglibs.gio.input_stream'
ffi = require 'ffi'
core = require 'ljglibs.core'

C = ffi.C

release = (p) ->
  C.g_input_stream_close, p, nil
  C.g_object_unref(p)

core.define 'GWin32InputStream < GInputStream', {
  properties: {
    handle: 'void*'
    close_handle: 'gboolean'
  }

}, (t, handle, close_handle = true) ->
  ffi.gc C.g_win32_input_stream_new(handle, close_handle), release
