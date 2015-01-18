#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <ffi_util.h>

FFI_UTIL_EXPORT struct stat *stat_new(const char *class)
{
  return malloc(sizeof(struct stat));
}

FFI_UTIL_EXPORT int stat_stat(struct stat *self, const char *path)
{
  return stat(path, self);
}

FFI_UTIL_EXPORT void stat_delete(struct stat *self)
{
  free(self);
}

FFI_UTIL_EXPORT dev_t stat_st_dev(struct stat *self)
{
  return self->st_dev;
}
