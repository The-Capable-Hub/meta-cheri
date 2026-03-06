TARGET=cheri-test
OBJECTS=cheri-test.c

CC ?=
CFLAGS ?=
LDFLAGS ?=

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: clean