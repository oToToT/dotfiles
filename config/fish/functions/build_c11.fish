function build_c11
    gcc $argv[1].c -o $argv[1].exe -std=c11 -Wall -Wextra -Wconversion -Wshadow -fsanitize=leak -fsanitize=undefined -fsanitize=address
end
