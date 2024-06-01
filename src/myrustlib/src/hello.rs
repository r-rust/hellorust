use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
pub extern fn string_from_rust() -> *const c_char {
    let s = CString::new("Hello ピカチュウ !").unwrap();
    s.into_raw()
}
