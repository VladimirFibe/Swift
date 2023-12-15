import Cocoa

var thread = pthread_t(bitPattern: 0)
var attr = pthread_attr_t()

pthread_attr_init(&attr)
pthread_create(&thread, &attr, { pointer in
    print("test")
    return nil
}, nil)
