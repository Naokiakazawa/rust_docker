use actix_web::{web, App, HttpResponse, HttpServer, Responder};

async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello, world!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    std::env::set_var("RUST_LOG", "info");
    env_logger::init();

    log::info!("Starting server");

    HttpServer::new(|| {
        App::new().route("/", web::get().to(hello))
    })
    .bind("0.0.0.0:8080")?
    .run()
    .await
}
