#include <stdio.h>
#include <stdint.h>

static void printPointer(void *pointer);

int main(int argc, char **argv)
{
    size_t sizeInt = sizeof(int64_t);
    size_t sizePointer = sizeof(uint8_t *);

    printf("The size of int64 is %lu-byte/%lu-bit and pointers are %lu-byte/%lu-bit \r\n", sizeInt, sizeInt << 3, sizePointer, sizePointer << 3);

    return 0;
}
