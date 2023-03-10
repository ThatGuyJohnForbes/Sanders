#ifndef SANDERS_PAGING_H
#define SANDERS_PAGING_H

#include <stdint.h>
#include <stddef.h>

//TODO: rename these to follow standards, e.g. osdev wiki
#define PAGING_CACHE_DISABLED  0b00010000
#define PAGING_WRITE_THROUGH   0b00001000
#define PAGING_ACCESS_FROM_ALL 0b00000100
#define PAGING_IS_WRITABLE     0b00000010
#define PAGING_IS_PRESENT      0b00000001

#define PAGING_TOTAL_ENTRIES_PER_TABLE 1024
#define PAGING_PAGE_SIZE               4096

struct paging_4gb_chunk {
    uint32_t* directory_entry;
};

struct paging_4gb_chunk* paging_new_4gb(uint8_t flags);
void paging_switch(uint32_t* directory);

extern void enable_paging();

#endif //SANDERS_PAGING_H
