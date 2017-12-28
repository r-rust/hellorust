// Modules are other .rs source files
mod hello;

// Export symbols for use by R
pub use hello::string_from_rust;
