import libwebsockets;
import std.stdio;


extern (C) int callback_http(libwebsocket_context* context,
    libwebsocket* wsi,
    libwebsocket_callback_reasons reason, void *user, void *inp, size_t len)
{
  return 0;
}

/* list of supported protocols and callbacks */

static libwebsocket_protocols protocols[] = [
  {
    name: "http-only\0".ptr,
    callback: &callback_http,
    per_session_data_size: 0
  },
  {
    name: null,
    callback: null,
    per_session_data_size: 0
  }
];

int main(string[] args)
{
  //writeln("Hello World, Reloaded");
  int port = 7681;
  int use_ssl = 0;
  libwebsocket_context* context;
  int opts = 0;
  //char interface_name[128] = "";
  string interface_name = "127.0.0.1";
  string cert_path = "\0";
  string key_path = "\0";
  //= NULL;
  context = libwebsocket_create_context(port, interface_name.dup.ptr, protocols.ptr,
        libwebsocket_internal_extensions.ptr,
        cert_path.dup.ptr, key_path.dup.ptr, -1, -1, opts);
  if (context == null) {
    writeln("libwebsocket init failed");
    return -1;
  }
  return 0;
}
