use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let input: &str = &args[1];

    println!(".intel_syntax noprefix");
    println!(".global main");
    println!("main:");
    println!("  mov     rax, {}", input);
    println!("  ret");
}
