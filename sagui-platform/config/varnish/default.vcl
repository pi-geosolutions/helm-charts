vcl 4.1;

backend tileserv {
    .host = "sagui-sagui-platform-pg-tileserv-svc";
    .port = "7800";
}

backend api {
    .host = "sagui-sagui-platform-backend-svc";
    .port = "8000";
}

backend nginx {
    .host = "sagui-nginx";
    .port = "80";
}

backend frontend {
    .host = "sagui-sagui-platform-frontend-svc";
    .port = "80";
}


sub vcl_deliver {
  # Display hit/miss info
  if (obj.hits > 0) {
    set resp.http.V-Cache = "HIT";
  }
  else {
    set resp.http.V-Cache = "MISS";
  }
}

sub vcl_backend_response {
#  unset beresp.http.set-cookie;
  if (beresp.status == 200) {
    unset beresp.http.Cache-Control;
    set beresp.http.Cache-Control = "public; max-age=30";
    set beresp.ttl = 30s;
  }
  set beresp.http.Served-By = beresp.backend.name;
  set beresp.http.V-Cache-TTL = beresp.ttl;
  set beresp.http.V-Cache-Grace = beresp.grace;
}

sub vcl_recv {
   if (req.url ~ "^/sagui") {
     #unset req.http.cookie;
     set req.backend_hint = frontend;
   } elsif (req.url ~ "^/tiles/") {
     unset req.http.cookie;
     set req.backend_hint = tileserv;
   } elsif (req.url ~ "^/api/" || req.url ~ "^/dashboards/") {
     #unset req.http.cookie;
     set req.backend_hint = api;
   } elsif (req.url ~ "^/admin/") {
     set req.backend_hint = api;
   } else {
     set req.backend_hint = nginx;
   }
}
