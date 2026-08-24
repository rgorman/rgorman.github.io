import os
import bs4
from bs4 import BeautifulSoup

def renumber_html(input_filename: str, output_filename: str):
    # Get the directory where renumber.py actually lives
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_filepath = os.path.join(script_dir, input_filename)
    output_filepath = os.path.join(script_dir, output_filename)

    with open(input_filepath, 'r', encoding='utf-8') as f:
        soup = BeautifulSoup(f, 'html.parser')

    # Find all sentence blocks
    containers = soup.find_all('div', class_='grid-container')

    for idx, container in enumerate(containers, start=1):
        # 1. Update the visible sentence number in <div class="item1">
        item1 = container.find('div', class_='item1')
        if item1:
            item1.string = str(idx)

        # 2. Update data-alpheios_tb_sent in <div class="item2">
        item2 = container.find('div', class_='item2')
        if item2 and 'data-alpheios_tb_sent' in item2.attrs:
            item2['data-alpheios_tb_sent'] = str(idx)

    with open(output_filepath, 'w', encoding='utf-8') as f:
        f.write(str(soup))

    print(f"Successfully renumbered {len(containers)} sentences in '{output_filepath}'.")

if __name__ == '__main__':
    renumber_html('readings-1.html', 'readings-1.html')