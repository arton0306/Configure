#include <iostream>
#include <cstring>
#include <cstdio>
#include <netinet/tcp.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <cassert>

using namespace std;

int SERVER_LISTEN_PORT = 53636;

int main() {
    int listen_fd;
    if ((listen_fd = socket(AF_INET, SOCK_STREAM, 0)) <= 0) {
        cout << "new socket error: " << strerror(errno);
    }

    int one = 1;
    if (setsockopt(listen_fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) < 0) {
        printf("listen_fd=%d Set reuse addr failed: %s\n", listen_fd, strerror(errno));
    }

    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    addr.sin_port = htons(SERVER_LISTEN_PORT);

    if (bind(listen_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
        printf("bind listen_fd=%d error: %s\n", listen_fd, strerror(errno));
        assert(false);
    }

    if (listen(listen_fd, 20) < 0) {
        printf("listen listen_fd=%d error: %s\n", listen_fd, strerror(errno));
        assert(false);
    }

    cout << "listening to port:" << SERVER_LISTEN_PORT << endl;

    socklen_t length = sizeof(addr);
    auto flag = fcntl(listen_fd, F_GETFL, 0) | O_NONBLOCK;
    fcntl(listen_fd, F_SETFL, flag);

    int client_fd;
    { // setup client_fd
        while (true) {
            if ((client_fd = accept(listen_fd, (struct sockaddr *)&addr, &length)) < 0) {
                if (errno == EWOULDBLOCK) {
                    continue;
                } else {
                    printf("accept failed and error=%s", strerror(errno));
                    return -1;
                }
            } else {
                printf("accept a new client, fd: %d\n", client_fd);
                break;
            }
        }
    }

    printf("accept connection fd=%d from %s:%d\n", client_fd, inet_ntoa(addr.sin_addr), htons(addr.sin_port));

    flag = 1;
    setsockopt(client_fd, IPPROTO_TCP, TCP_NODELAY, &flag, sizeof(flag));
    flag = fcntl(client_fd, F_GETFL, 0) | O_NONBLOCK;
    fcntl(client_fd, F_SETFL, flag);

    unsigned char *buffer = new unsigned char[1024];
    while (true) {
        int recv_len = read(client_fd, buffer, 1024);
        if (recv_len < 0) {
            if (errno == EWOULDBLOCK) {
                continue;
            } else {
                printf("fd=%d recv failed, recv_len=%d error=%s, disconnected\n", client_fd, recv_len, strerror(errno));
                break;
            }
        } else if (recv_len == 0) {
            printf("recv EOF, disconnected\n");
            break;
        } else {
            const int v = *(int *)buffer;
            printf("recv_len=%d(should be 4) value=%d, send back to client\n", recv_len, v);
            for (int i = 0; i < recv_len; ++i) {
                printf("%dth byte:%u\n", i+1, (unsigned int)*(buffer+i));
            }
            write(client_fd, &v, sizeof(v));
        }
    }
    delete [] buffer;

    return 0;
}
