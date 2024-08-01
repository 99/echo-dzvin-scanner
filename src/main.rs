use actix_web::{web, App, HttpServer, Responder};
use serde::Serialize;
use trust_dns_resolver::TokioAsyncResolver;

#[derive(Serialize)]
struct IpInfo {
    ip: String,
}

async fn resolve_ip(domain: web::Path<String>) -> impl Responder {
    let resolver = TokioAsyncResolver::tokio_from_system_conf().unwrap();
    let response = resolver.lookup_ip(domain.as_str()).await.unwrap();
    let ip = response.iter().next().unwrap().to_string();
    web::Json(IpInfo { ip })
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/{domain}", web::get().to(resolve_ip))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
