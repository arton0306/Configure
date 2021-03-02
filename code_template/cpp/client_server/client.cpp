#include <iostream>
#include <cstring>
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
    int server_fd;
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) <= 0) {
        cout << "new socket error: " << strerror(errno);
    }

    struct sockaddr_in dest;
    memset(&dest, 0, sizeof(dest));
    dest.sin_family = AF_INET;
    dest.sin_addr.s_addr = inet_addr("127.0.0.1");
    dest.sin_port = htons(SERVER_LISTEN_PORT);

    if (connect(server_fd, (struct sockaddr *)&dest, sizeof(dest)) != 0) {
        cout << "failed to connect to server ip:127.0.0.1 port:" << SERVER_LISTEN_PORT << endl;
    } else {
        cout << "successful to connect to server ip:127.0.0.1 port:" << SERVER_LISTEN_PORT << endl;
        int flag = fcntl(server_fd, F_GETFL, 0) | O_NONBLOCK;
        bool is_ok = (fcntl(server_fd, F_SETFL, flag) != -1);
        assert(is_ok);
    }

    char *buffer = new char[1024];
    unsigned num_no_msg_from_server = 0;
    while (true) {
        int recv_len = read(server_fd, buffer, 1024);
        if (recv_len < 0) {
            if (errno == EWOULDBLOCK || errno == EAGAIN) {
                num_no_msg_from_server++;
                if (num_no_msg_from_server % 1000000 == 0) {
                    int x;
                    cout << "send a value(int) to server: ";
                    cin >> x;
                    write(server_fd, &x, sizeof(x));
                }
                continue;
            } else {
                cout << "recv failed, recv_len=" << recv_len << endl;
                break;
            }
        } else if (recv_len == 0) {
            cout << "recv EOF, disconnect with server" << endl;
            break;
        } else {
            const int v = *(int*)buffer;
            printf("client recv ok, recv_len=%d (should be 4), value=%d\n", recv_len, v);
            if (v == -123) {
                cout << "value is -123 => close server_fd" << endl;
                close(server_fd);
                break;
            }
        }
    }

    delete [] buffer;
    sleep(3); // waiting for the ack of fin?

    return 0;
}
