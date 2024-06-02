use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn string_from_rust() -> *const c_char {
    let s = CString::new("Hello ピカチュウ !").unwrap();
    s.into_raw()
}

#[no_mangle]
pub extern "C" fn free_string_from_rust(ptr: *mut c_char) {
    let _ = unsafe { CString::from_raw(ptr) };
}
