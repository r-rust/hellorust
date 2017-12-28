use libc::int32_t;
use rand::random;

#[no_mangle]
pub extern fn random_number() -> int32_t {
  let tuple = random::<i32>();
  tuple as int32_t
}
