## misc

* `operator[]` of std::map, std::unoreded_map is not a const member function because it calls default ctor when the key does not exist. 
* high warning levels `-Wall -Wextra -pedantic`
* prevent false sharing `alignas (64)` https://www.youtube.com/watch?v=BP6NxVxDQIs&feature=youtu.be&t=2877
