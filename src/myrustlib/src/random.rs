use rand::random;

#[no_mangle]
pub extern "C" fn random_number() -> i32 {
  let tuple = random::<i32>();
  tuple
}
