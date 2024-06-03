#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

char * string_from_rust(void);
void free_string_from_rust(char*);
int32_t random_number(void);
void run_threads(void);

#ifdef __cplusplus
}
#endif
