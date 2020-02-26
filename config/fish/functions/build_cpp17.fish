function build_cpp17
    g++ $argv[1].cpp -o $argv[1].exe -std=c++17 -Wall -Wextra -Wconversion -Wshadow -fsanitize=leak -fsanitize=undefined -fsanitize=address
end
