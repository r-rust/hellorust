// Import dependencies
extern crate libc;
extern crate rand;

// Modules are other .rs source files
mod hello;
mod random;

// Export functions called by R
pub use hello::string_from_rust;
pub use random::random_number;
