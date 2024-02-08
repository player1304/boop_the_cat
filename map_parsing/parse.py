def read_map_file(file_path) -> list:
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    map_array : list = []
    for line in lines:
        row = [int(digit) for digit in line.strip()]
        map_array.append(row)
    
    return map_array


def get_non_zero_locations(map_array) -> list:
    non_zero_locations : list = []
    for row in range(len(map_array)):
        for col in range(len(map_array[row])):
            if map_array[row][col] != 0:
                # change location to Vector2
                s = f"Vector2({col}, {row})"
                non_zero_locations.append(s)
    
    return non_zero_locations

if __name__ == '__main__':
    file_path = 'map.txt'
    map_array : list = read_map_file(file_path)
    non_zero_locations : list = get_non_zero_locations(map_array)

    # remove the quotes around Vector2(x,y)'s
    output : str = '[' + ', '.join(str(e) for e in non_zero_locations) + ']'

    print(f"The list of non-zero locations is: \n{output}")